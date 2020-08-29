import 'dart:convert';
import 'dart:io';

import 'package:cofresenha/src/data/crypt.dart';
import 'package:cofresenha/src/data/help_file.dart';
import 'package:cofresenha/src/data/model/book.dart';
import 'package:cofresenha/src/data/model/password.dart';
import 'package:cofresenha/src/data/preference_helper.dart';

class Repository {
  Repository._internal(this._helpFile, this._preferenceHelper);

  static  Repository _this;

  factory Repository({HelpFile helpFile, PreferenceHelper pHelper}) {
    if(_this == null)
      _this = Repository._internal( helpFile ?? HelpFile(),
        pHelper ?? PreferenceHelper());

    return _this;
  }

  //----------------------- Repository --------------
  final HelpFile _helpFile;
  final PreferenceHelper _preferenceHelper;
  Crypto _crypt;
  String bookName;

  List<Book> _books = List<Book>();

  File _file;

  void setFile(File file) => _file = file;
  String getFileName() => _file.path.split('/').last;

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
    String data = jsonEncode(_books);
    String fileString = _crypt.encryptRepositoryBase64(data);
    _helpFile.writeFile(fileString, _file);
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
    if(name == null)
      return (_books.where((item) => item.name == bookName)).single.passwords ?? List<Password>();
    return (_books.where((item) => item.name == name)).single.passwords ?? List<Password>();
  }

  void addPassword(Password password) {
    List<Password> passwords =
        (_books.where((item) => item.name == bookName)).single.passwords;
    if (passwords == null) {
      var list = List<Password>();
      list.add(password);
      (_books.where((item) => item.name == bookName)).single.passwords = list;
    } else
      passwords.add(password);
    updateFile();
  }

  void removeItemPassword(Password password) {
    (_books.where((item) => item.name == bookName))
      .single.passwords
      .remove(password);
    updateFile();
  }

  void restoreItemPassword(Password password, int position) {
    (_books.where((item) => item.name == bookName))
      .single.passwords
      .insert(position, password);
    updateFile();
  }

  Password getPassword(String title) {
    return getListPassword(name: bookName).where((element) => element.title == title)
        as Password;
  }
}
