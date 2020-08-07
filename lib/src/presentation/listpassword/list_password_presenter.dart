
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

}
