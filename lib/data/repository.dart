import 'dart:convert';
import 'dart:io';

import 'package:cofresenha/data/crypt.dart';
import 'package:cofresenha/data/help_file.dart';
import 'package:cofresenha/data/model/book.dart';
import 'package:cofresenha/data/model/password.dart';

class Repository {
  Repository._internal();

  static final Repository _this = Repository._internal();

  factory Repository() {
    return _this;
  }

  //----------------------- Repository --------------
  Crypto _crypt;
  HelpFile _helpFile = HelpFile();
  String bookName;

  List<Book> _books = List<Book>();

  File _file;

  void setFile(File file) => _file = file;

  // --------- cria o repositorio --------
  void createRepository(String password) {
    _crypt = Crypto(password);
    _books = List<Book>();
    updateFile();
  }

  // -------- ler o repositorio ---------
  void openRepository(String password) {
    _crypt = Crypto(password);

    _helpFile.readFile(_file).then((data) {
      String fileString = _crypt.decryptRepository(data);
      var listBook = json.decode(fileString) as List;

      _books = listBook.map((i) => Book.fromJson(i)).toList();
    });
  }

  void logoutRepository(){
    _crypt = null;
    _file = null;
    _books = null;
  }

  // ------------update file ---------------
  void updateFile() {
    /*String data = jsonEncode(_books);
    String fileString = _crypt.encryptRepositoryBase64(data);
    _helpFile.writeFile(fileString, _file);*/
  }

  // -------- book --------------
  List<Book> getListBook() {
    return _books;
  }

  void addBook(String book) {
    _books.add(Book(name: book));
    updateFile();
  }

  void updateBook(Book book, String name) {
    var pos = _books.indexOf(book);
    _books[pos].name = name;
    updateFile();
  }

  void removeItemBook(Book book) {
    _books.remove(book);
    updateFile();
  }

  void restoreItemBook(Book book, int position) {
    _books.insert(position, book);
    updateFile();
  }

  //--------- Password -----------
  List<Password> getListPassword({String name}) {
    if(bookName == null)
      return (_books.where((item) => item.name == bookName) as Book).passwords;
    return (_books.where((item) => item.name == name) as Book).passwords;
  }

  void addPassword(Password password) {
    List<Password> passwords =
        (_books.where((item) => item.name == bookName) as Book).passwords;
    if (passwords == null) {
      var list = List<Password>();
      list.add(password);
      (_books.where((item) => item.name == bookName) as Book).passwords = list;
    } else
      passwords.add(password);
    updateFile();
  }

  void removeItemPassword(Password password) {
    (_books.where((item) => item.name == bookName) as Book)
        .passwords
        .remove(password);
    updateFile();
  }

  void restoreItemPassword(Password password, int position) {
    (_books.where((item) => item.name == bookName) as Book)
        .passwords
        .insert(position, password);
    updateFile();
  }

  Password getPassword(String title) {
    return getListPassword(name: bookName).where((element) => element.title == title)
        as Password;
  }
}
