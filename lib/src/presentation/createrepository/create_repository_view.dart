
import 'package:cofresenha/src/presentation/createrepository/create_repository_presenter.dart';
import 'package:cofresenha/src/ui/screens/createrepository/create_repository_screen.dart';

abstract class CreateRepositoryView{
  CreateRepositoryScreen screen;

  void setPathRepository(String name);
  void setRememberPassword(bool remember);
  void navigationListBook();
  void loadingVisibility(bool enable);
  void infoError(e);
}
