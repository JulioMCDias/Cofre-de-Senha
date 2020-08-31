
import 'package:cofresenha/src/ui/screens/addpassword/add_password_screen.dart';

abstract class AddPasswordView{
  AddPasswordScreen screen;
  void navigationBlackScreen();
  void loadingVisibility(bool enable);
  Function(String) infoError;

  get title;
  get name;
  get email;
  get password;
  get description;

  set title(title);
  set name(name);
  set email(email);
  set password(password);
  set description(description);
}
