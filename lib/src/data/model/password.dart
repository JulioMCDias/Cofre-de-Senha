
import 'dart:core';

import 'package:flutter/widgets.dart';

class Password{
  String title;
  String name;
  String email;
  String password;
  String description;

  Password({@required this.title, this.name, @required this.email, @required this.password, this.description});


  Password.fromJson(Map<String, dynamic> json)
    : title = json['title'],
      name = json['name'],
      email = json['email'],
      password = json['password'],
      description = json['description'];

  Map<String, dynamic> toJson() => {
      'title': title,
      'name': name,
      'email': email,
      'password': password,
      'description': description,
    };

  @override
  String toString() {
    return "title: $title, name: $name, email: $email, password: $password, description: $description";
  }
}