
import 'package:cofresenha/src/data/model/password.dart';
import 'package:cofresenha/src/ui/screens/listpassword/list_password_screen.dart';

abstract class ListPasswordView{
  ListPasswordScreen screen;

  void setListPassword(List<Password> passwords);
  void setTitle(String title);
  Future<void> navigationScreen(Password password);
}
