
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
      _repository.createRepository(password);
      view.navigationListBook();
  }

  String getNameFile() => _repository.getFileName();
}
