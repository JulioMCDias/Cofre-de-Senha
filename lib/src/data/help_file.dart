

import 'dart:io';
import '../utils/constants.dart' as Constants;

import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';

class HelpFile{

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
    return File('$path/$nameFile.${Constants.TYPE_FILE}');
}

  // write in file
  Future<File> writeFile(String message, File file) async {
    return file.writeAsString(message);
  }

  // Reload file
  Future<String> readFile(File file) async{
    return file.readAsString();
  }

  Future<File> openFileType(List<String> types) async =>
    await FilePicker.getFile(type: FileType.custom, allowedExtensions: types);

}