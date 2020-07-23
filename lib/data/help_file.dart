

import 'dart:io';
import '../utils/constants.dart' as Constants;

import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';

class HelpFile{
  File _file;

  // pega o local escolido pelo usuario
  Future<String> openDirectoryPath() async =>
    await FilePicker.getDirectoryPath();

  // local padrão
  Future<String> localPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  // create new file
  Future<File> createFile(String nameFile, String local) async {

    final path = (local == null)? localPath(): local;
    _file = File('$path/$nameFile.${Constants.TYPE_FILE}');
    return _file;
}

  // write in file
  Future<File> writeFile(String message) async {
    return _file.writeAsString(message);
  }


  Future<File> openFileType(List<String> types) async =>
    await FilePicker.getFile(type: FileType.custom, allowedExtensions: types);

}