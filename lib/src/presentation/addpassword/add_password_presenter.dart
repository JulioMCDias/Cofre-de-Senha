
import 'package:cofresenha/src/data/model/password.dart';
import 'package:cofresenha/src/data/repository.dart';
import 'package:cofresenha/src/presentation/addpassword/add_password_view.dart';
import 'package:cofresenha/src/ui/screens/addpassword/add_password_bloc.dart';

class AddPasswordPresenter{
  AddPasswordView view;
  final Repository _repository = Repository();
  Password password;

  AddPasswordPresenter({this.password}){
    view = AddPasswordBloc(this);
  }
  


  //---------------- AddPasswordPresenter -------------------
  void setPassword(Password password){
    this.password = password;
    if(password != null){
      view.title = password.title;
      view.name = password.name;
      view.email = password.email;
      view.password = password.password;
      view.description = password.description;
    }
  }

  void save(){
    if(password == null){
      _repository.addPassword(Password()
        ..title = view.title
        ..name = view.name
        ..email = view.email
        ..password = view.password
        ..description = view.description);

    }else {
      password
        ..title = view.title
        ..name = view.name
        ..email = view.email
        ..password = view.password
        ..description = view.description;
    }
    view.navigationBlackScreen();
  }


}
