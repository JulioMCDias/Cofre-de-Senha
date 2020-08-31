
import 'package:cofresenha/src/data/model/password.dart';
import 'package:cofresenha/src/data/repository.dart';
import 'package:cofresenha/src/presentation/listpassword/list_password_view.dart';
import 'package:cofresenha/src/ui/screens/listpassword/list_password_bloc.dart';

class ListPasswordPresenter{
  ListPasswordView view;
  final Repository _repository = Repository();

  ListPasswordPresenter(){
    view = ListPasswordBloc(this);
  }
  


  //---------------- ListPasswordPresenter -------------------
  Password _oldPassword;
  int _pos;
  void updateList(){
    view.setListPassword(_repository.getListPassword());
  }

  void setTitle(){
    view.setTitle(_repository.bookName);
  }

  void addPassword() {
    view.navigationScreen(null).then((value) => updateList());
  }

  void editPassword(Password password){
    view.navigationScreen(password).then((value) => updateList());
  }

  void removePassword(password, index) {
    view.loadingVisibility(true);
    _repository.removeItemPassword(password).then((_){
      updateList();
      _oldPassword = password;
      _pos = index;
      view.loadingVisibility(false);

    }).catchError((e){
      view.infoError(e);
      view.loadingVisibility(false);
    });
  }

  void restoreItem() {
    view.loadingVisibility(true);
    _repository.restoreItemPassword(_oldPassword, _pos).then((_){
      updateList();
      view.loadingVisibility(false);

    }).catchError((e){
      view.infoError(e);
      view.loadingVisibility(false);
    });
  }

}
