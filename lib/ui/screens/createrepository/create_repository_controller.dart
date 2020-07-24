import 'package:cofresenha/data/help_file.dart';
import 'package:cofresenha/data/repository.dart';
import 'package:cofresenha/ui/screens/createrepository/create_repository_bloc.dart';
import 'package:cofresenha/ui/screens/listbook/list_book_screen.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class CreateRepositoryCon extends ControllerMVC{
  final _repository = Repository();
  final _helpFile = HelpFile();
  CreateRepositoryBloc bloc;

  // Singleton Factory
  CreateRepositoryCon._();
  static final CreateRepositoryCon _this = CreateRepositoryCon._();

  factory CreateRepositoryCon() {
    return _this;
  }



  //------------------- CreateRepository -------------------------
  String _path;

  void openDirectoryPath(){
    _helpFile.openDirectoryPath().then((value){
      if(value == null) {
        _helpFile.localPath().then((value){
          _path = value;
          bloc.setPathRepository(value);
        });

      }else {
        _path = value;
        bloc.setPathRepository(value);
      }
    });
  }

  void createRepository(String password, String nameFile){
    _helpFile.createFile(nameFile, _path).then((file){

      _repository.setFile(file);


      _navigationListBook();
    });
  }


  void _navigationListBook(){
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => ListBookScreen())
    );
  }

}