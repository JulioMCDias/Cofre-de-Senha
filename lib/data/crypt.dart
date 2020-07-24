import 'dart:typed_data';


import 'package:encrypt/encrypt.dart';
import 'package:password_hash/password_hash.dart';

class Crypto{
  static final Uint8List salt = Uint8List.fromList([0,0,0,0,0,0,0,0]);
  static final String _ivSeparator = "]";
  Encrypter _encrypted;

  Crypto(String password){
    var key = generateKey(password);
    _encrypted = Encrypter(AES(key, mode: AESMode.cbc ,padding: 'PKCS7'));
  }

  Key generateKey(String password){
    var gen = PBKDF2();
    var key = Uint8List.fromList(gen.generateKey(password, String.fromCharCodes(salt), 1000, 32));
    print(key);
    return Key(key);
  }

  IV generateIv(){
    return IV.fromLength(16);
  }

  String encryptRepositoryBase64(String data){
    final iv = generateIv();
    String repository = _encrypted.encrypt(data, iv: iv).base64;
    return iv.base64 + _ivSeparator + repository;
  }

  String decryptRepository(String data){
    var split = data.split( RegExp(_ivSeparator));
    if (split.length != 2) throw Exception("Passed data is incorrect. There was no IV specified with it.");

    var iv = IV.fromBase64(split[0]);
    var encrypted = Encrypted.fromBase64(split[1]);
    return _encrypted.decrypt(encrypted, iv: iv);
  }
}