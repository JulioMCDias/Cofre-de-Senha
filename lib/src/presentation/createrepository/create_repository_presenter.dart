
import 'package:cofresenha/src/data/repository.dart';
import 'package:cofresenha/src/presentation/createrepository/create_repository_view.dart';
import 'package:cofresenha/src/ui/screens/createrepository/create_repository_bloc.dart';

class CreateRepositoryPresenter{
  CreateRepositoryView view;
  final _repository = Repository();

  CreateRepositoryPresenter(){
    view = CreateRepositoryBloc(this);
  }


  // ------------- CreateRepositoryPresenter -------------------
  void createRepository(String password){
    view.loadingVisibility(true);
      _repository.createRepository(password).then((_){
        view.navigationListBook();
        view.loadingVisibility(false);
      }).catchError((e){
        view.infoError(e);
        view.loadingVisibility(false);
      });
  }


  void init() {
    view.setPathRepository(_repository.getPathFile());
  }
}
