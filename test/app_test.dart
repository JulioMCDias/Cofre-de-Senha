import 'dart:io';

import 'package:cofresenha/src/data/help_file.dart';
import 'package:cofresenha/src/data/model/password.dart';
import 'package:cofresenha/src/data/repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cofresenha/src/data/crypt.dart';
import 'package:mockito/mockito.dart';


class FakeHelpFile extends Fake implements HelpFile {
  String saida;
  @override
  Future<File> writeFile(String message, File file) async {
    print("saida encrypt: " + message);
    saida = message;
    return null;
  }

  @override
  Future<String> readFile(File file) async{
    return Future.value(saida);
  }

}

void main(){
  final password = "1234";

  group('cripitação', () {

    String data = "ola mundo";
    String _key;
    String _out;

    test("encrypt", () {
      final crypto = Crypto(password);
      _key = crypto.generateKey(password, crypto.generateSalt()).base64;
      print("chave : $_key");

      print("IV aleatorio: ${crypto.generateIv().base64}");

      _out = crypto.encryptRepositoryBase64(data);
      print("saida encriptografada: $_out");

    });

    test("decrypt", () {
      final crypto = Crypto(password);
      _key = crypto.generateKey(password, crypto.generateSalt()).base64;
      print("chave : $_key");

      print("IV aleatorio: ${crypto.generateIv().base64}");

      String outDecrypt = crypto.decryptRepository(_out);
      print("saida encriptografada: $outDecrypt");
    });

  });


  group('json', () {
    test('codific', () {

      HelpFile _helpFile = FakeHelpFile();

      final repository = Repository(helpFile: _helpFile);
      repository.createRepository(password);
      repository.addBook("novo livro");
      repository.bookName ="novo livro";
      repository.addPassword(
        Password(title: "ola", name: "julio", email: "email@emal.com", password: "123456"));

    });

    test('descodific', () {
      HelpFile _helpFile = FakeHelpFile();

      final repository = Repository(helpFile: _helpFile);
      repository.openRepository(password);

      print(repository.getListBook().elementAt(0).passwords.elementAt(0).toString());
    });
  });

}