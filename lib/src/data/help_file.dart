

import 'dart:io';
import 'package:open_file/open_file.dart';

import '../utils/constants.dart' as Constants;


class HelpFile{

  // open file
  Future<File> openFile() async {
    return await OpenFile.openFile(
      type: Constants.TYPE_FILE, extension: Constants.EXTENSION_FILE).then((value){
      return Future.value(value.file);
    }).catchError((e){
      return Future.error(e);
    });
  }


  // create new file
  Future<File> createFile(String extension, String name) async {
    return await OpenFile.createFile(Constants.TYPE_FILE, extension, name)
      .then((value) {
      return  Future.value(value.file);
    }).catchError((e){
      return  Future.error(e);
    });
  }



  // write in file
  Future<File> writeFile(String message, File file) async {
    return file.writeAsString(message);
  }

  // Reload file
  Future<String> readFile(File file) async{
    return file.readAsString();
  }
}