
import 'dart:io';

import 'package:cofresenha/src/data/help_file.dart';
import 'package:cofresenha/src/data/repository.dart';
import 'package:cofresenha/src/presentation/openrepository/open_repository_view.dart';
import 'package:cofresenha/src/ui/screens/openrepository/open_repository_bloc.dart';

class OpenRepositoryPresenter{
  OpenRepositoryView view;
  final _repository = Repository();
  final _helpFile = HelpFile();

  OpenRepositoryPresenter(){
    view = OpenRepositoryBloc(this);
  }


  final String pass="*****";
  //---------------- OpenRepositoryPresenter -------------------
  String _password;
  List<String> paths;
  String _oldPath;
  int _oldIndex;

  void openRepositoryPath(){
    _helpFile.openFile().then((file) {
      if(file != null) {
        _repository.setFile(file);
        setPath();
      }
    }).catchError((e){
      view.infoError(e.toString());
    });
  }

  void open(String password) {
    view.loadingVisibility(true);
    String p = (view.rememberPassword && _password != null) ?
    _password : password;

    _openRepository(p);
  }

  void _openRepository(String password) {
    _repository.openRepository(password).then((_) {
      _setRememberPassword(password);
      _setNewHistoric();
      view.loadingVisibility(false);
      view.navigationListBook();
    }).catchError((e){
      view.loadingVisibility(false);
      view.infoError(e.toString());
    });
  }


  // salva a senha
  void _setRememberPassword(String password) {
      _repository.enablePasswordRemember(view.rememberPassword, password);
  }


  void _getRememberPassword() async{
    String password = await _repository.getPasswordRemember();
    if(password != null) {
      view.password = pass;
      _password = password;
      view.setRememberPassword(true);
    }else {
      view.password = "";
      _password = null;
      view.setRememberPassword(false);
    }
  }


  void init() async{
    paths = await _repository.historicFilePath();
    view.setListRepository(paths);
  }


  // ----------------- list de repository path ------------------
  void _setNewPathHistoric(){
    if(paths.firstWhere((element) =>
        element.contains(_repository.getPathFile()), orElse: ()=> null) == null)
      paths.add(_repository.getPathFile());
  }

  void _setNewHistoric(){
    _setNewPathHistoric();
    _repository.setHistoricFilePath(paths);
  }

  void setPath() {
    view.setPathRepository(_repository.getPathFile());
    _getRememberPassword();
  }


  void setItemPath(String path) {
    _repository.setFile(File(path));
    setPath();
  }

  void removePath(String path, int index) {
    this._oldPath = path;
    this._oldIndex = index;
    paths.removeAt(index);
    view.setListRepository(paths);
  }

  void restoreItemPath() {
    paths.insert(_oldIndex, _oldPath);
    view.setListRepository(paths);
  }

}
