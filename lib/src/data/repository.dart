import 'dart:async';
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
  String getPathFile() => _file.path;

  // --------- cria o repositorio --------
  Future<void> createRepository(String password) async {
    try{
      _crypt = Crypto(password);
      _books = List<Book>();
      updateFile();
    }catch(e) {
      return Future.error(e);
    }
  }

  // -------- ler o repositorio ---------
  Future<void> openRepository(String password) async {
    _crypt = Crypto(password);

    try {
      String data = await _helpFile.readFile(_file);
      String fileString = await _crypt.decryptRepository(data);

      var listBook = json.decode(fileString) as List;
      _books = listBook.map((i) => Book.fromJson(i)).toList();

    } on ArgumentError catch(e){
      return Future.error(e);
    }
  }

  void logoutRepository(){
    _crypt = null;
    _file = null;
    _books = null;
  }

  // ------------update file ---------------
  void updateFile() async {
    String data = jsonEncode(_books);
    String fileString = _crypt.encryptRepositoryBase64(data);
    await _helpFile.writeFile(fileString, _file);
  }



  // ---------- preferences -------------
  void enablePasswordRemember(enable, password){
    _preferenceHelper.setPasswordRemember(getPathFile(), enable);
    if(enable)
      _preferenceHelper.setPasswordKey(getPathFile(), password);
    else
      _preferenceHelper.removerPasswordKey(getPathFile());
  }

  Future<String> getPasswordRemember() async{
    return await _preferenceHelper.getPasswordRemember(getPathFile()) ?
      _preferenceHelper.getPasswordKey(getPathFile()) : null;
  }

  void setHistoricFilePath(List<String> historic){
    _preferenceHelper.setHistoric(historic);
  }

  Future<List<String>> historicFilePath() async{
    return _preferenceHelper.getHistoric() ?? Future.value(List<String>());
  }



  // --------------------- book ------------------------
  List<Book> getListBook() {
    return _books;
  }

  Future<void> addBook(String book) async {
    try{
      _books.add(Book(name: book));
      updateFile();
    } catch(e){
      return Future.error(e);
    }
  }


  Future<void> updateBook(Book book, String name) async {
    try {
      var pos = _books.indexOf(book);
      _books[pos].name = name;
      updateFile();
    }catch(e) {
      return Future.error(e);
    }
  }

  Future<void> removeItemBook(Book book) async {
    try {
      _books.remove(book);
      updateFile();
    }catch(e) {
      return Future.error(e);
    }
  }

  Future<void> restoreItemBook(Book book, int position) async {
    try {
      _books.insert(position, book);
      updateFile();
    }catch(e) {
      return Future.error(e);
    }
  }

  //--------- Password -----------
  List<Password> getListPassword({String name}) {
    if(name == null)
      return (_books.where((item) => item.name == bookName)).single.passwords ?? List<Password>();
    return (_books.where((item) => item.name == name)).single.passwords ?? List<Password>();
  }

  Future<void> addPassword(Password password) async {
    try{
      List<Password> passwords =
          (_books.where((item) => item.name == bookName)).single.passwords;
      if (passwords == null) {
        var list = List<Password>();
        list.add(password);
        (_books.where((item) => item.name == bookName)).single.passwords = list;
      } else
        passwords.add(password);
      updateFile();

    }catch(e) {
      return Future.error(e);
    }
  }

  Future<void> updatePassword() async {
    try{
      updateFile();
    }catch(e) {
      return Future.error(e);
    }
  }

  Future<void> removeItemPassword(Password password) async {
    try{
      (_books.where((item) => item.name == bookName))
        .single.passwords
        .remove(password);
      updateFile();
    }catch(e) {
      return Future.error(e);
    }
  }

  Future<void> restoreItemPassword(Password password, int position) async {
    try{
      (_books.where((item) => item.name == bookName))
        .single.passwords
        .insert(position, password);
      updateFile();
    }catch(e) {
      return Future.error(e);
    }
  }

  Password getPassword(String title) {
    return getListPassword(name: bookName).where((element) => element.title == title)
        as Password;
  }
}
