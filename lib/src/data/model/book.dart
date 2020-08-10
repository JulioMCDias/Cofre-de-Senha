import 'package:cofresenha/src/data/model/password.dart';

class Book{
  String name;
  List<Password> passwords;

  Book({this.name, this.passwords});

  Book.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      passwords = (json['passwords'] as List).map((i) => Password.fromJson(i)).toList();


  Map<String, dynamic> toJson() => {
    'name' : name,
    'passwords' : passwords,
  };

}