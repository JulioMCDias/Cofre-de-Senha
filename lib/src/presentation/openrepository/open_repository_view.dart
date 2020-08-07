
import 'package:cofresenha/src/ui/screens/openrepository/open_repository_screen.dart';

abstract class OpenRepositoryView{
  OpenRepositoryScreen screen;

  void setPathRepository(String name);
  void setRememberPassword(bool remember);

  void navigationListBook();
}
