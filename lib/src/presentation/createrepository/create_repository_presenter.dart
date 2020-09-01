
import 'package:cofresenha/src/data/repository.dart';
import 'package:cofresenha/src/presentation/createrepository/create_repository_view.dart';
import 'package:cofresenha/src/ui/screens/createrepository/create_repository_bloc.dart';

class CreateRepositoryPresenter{
  CreateRepositoryView view;
  final _repository = Repository();

  CreateRepositoryPresenter(){
    view = CreateRepositoryBloc(this);
  }

  final String pass="*****";
  // ------------- CreateRepositoryPresenter -------------------
  String _password;

  void createRepository(String password){
    view.loadingVisibility(true);
    String p = (view.rememberPassword && _password != null) ?
    _password : password;

    _createRepository(p);
  }


  void _createRepository(String password){
    _repository.createRepository(password).then((_){
      _setRememberPassword(password);
      view.navigationListBook();
      view.loadingVisibility(false);
    }).catchError((e){
      view.infoError(e.toString());
      view.loadingVisibility(false);
    });
  }


  // salva a senha
  void _setRememberPassword(String password){
    _repository.enablePasswordRemember(view.rememberPassword, password);
  }


  void init() {
    view.setPathRepository(_repository.getPathFile());
    _getRememberPassword();
  }

  void _getRememberPassword() async{
    String password = await _repository.getPasswordRemember();
    if(password != null) {
      view.password = pass;
      _password = password;
    }
  }
}
