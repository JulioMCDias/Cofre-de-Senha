import 'dart:convert';
import 'dart:typed_data';


import 'package:encrypt/encrypt.dart';
import 'package:password_hash/password_hash.dart';

class Crypto{
  static final String _separator = "]";
  final String _password;

  Crypto(this._password);

  Key generateKey(String password,Uint8List salt){
    var gen = PBKDF2();
    var key = Uint8List.fromList(gen.generateKey(password, String.fromCharCodes(salt), 1000, 32));
    return Key(key);
  }

  IV generateIv(){
    return IV.fromSecureRandom(16);
  }

  Uint8List generateSalt(){
    return SecureRandom(8).bytes;
  }

  Encrypter _gerEncrypted(Key key){
    return Encrypter(AES(key, mode: AESMode.cbc ,padding: 'PKCS7'));
  }

  String encryptRepositoryBase64(String data){
    var salt = generateSalt();
    var key = generateKey(_password, salt);
    var _encrypted = _gerEncrypted(key);

    final iv = generateIv();
    String repository = _encrypted.encrypt(data, iv: iv).base64;
    return base64Encode(salt) + _separator + iv.base64 + _separator + repository;
  }

  String decryptRepository(String data){
    var split = data.split( RegExp(_separator));
    if (split.length != 3) throw Exception("Passed data is incorrect. There was no IV specified with it.");

    var salt = base64Decode(split[0]);
    var iv = IV.fromBase64(split[1]);

    Encrypter _encrypted = _gerEncrypted(generateKey(_password, salt));
    var encrypted = Encrypted.fromBase64(split[2]);
    return _encrypted.decrypt(encrypted, iv: iv);
  }
}