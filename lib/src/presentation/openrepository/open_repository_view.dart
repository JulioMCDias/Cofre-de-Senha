
import 'package:cofresenha/src/ui/screens/openrepository/open_repository_screen.dart';

abstract class OpenRepositoryView{
  OpenRepositoryScreen screen;
  void loadingVisibility(bool enable);

  void setPathRepository(String name);
  void setRememberPassword(bool remember);

  void navigationListBook();

  Function(String) infoError;
  set password(password);
  bool get rememberPassword;

  void setListRepository(List<String> paths);
}
