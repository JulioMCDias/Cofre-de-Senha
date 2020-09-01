
import 'package:cofresenha/src/data/repository.dart';
import 'package:cofresenha/src/presentation/openrepository/open_repository_view.dart';
import 'package:cofresenha/src/ui/screens/openrepository/open_repository_bloc.dart';

class OpenRepositoryPresenter{
  OpenRepositoryView view;
  final _repository = Repository();

  OpenRepositoryPresenter(){
    view = OpenRepositoryBloc(this);
  }


  final String pass="*****";
  //---------------- OpenRepositoryPresenter -------------------
  String _password;


  void openRepository(String password) {
    view.loadingVisibility(true);
    String p = (view.rememberPassword && _password != null) ?
    _password : password;

    _openRepository(p);
  }

  void _openRepository(String password) {
    _repository.openRepository(password).then((_) {
      _setRememberPassword(password);
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

  void init() {
    view.setPathRepository(_repository.getPathFile());
    _getRememberPassword();
  }


  void _getRememberPassword() async{
    String password = await _repository.getPasswordRemember();
    if(password != null) {
      view.password = pass;
      _password = password;
      view.setRememberPassword(true);
    }
  }

}
