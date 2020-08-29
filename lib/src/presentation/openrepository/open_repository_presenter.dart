
import 'package:cofresenha/src/data/repository.dart';
import 'package:cofresenha/src/presentation/openrepository/open_repository_view.dart';
import 'package:cofresenha/src/ui/screens/openrepository/open_repository_bloc.dart';

class OpenRepositoryPresenter{
  OpenRepositoryView view;
  final _repository = Repository();

  OpenRepositoryPresenter(){
    view = OpenRepositoryBloc(this);
  }



  //---------------- OpenRepositoryPresenter -------------------
  Future<void> openRepository(String password) async {
    return _repository.openRepository(password);
  }

  void init() {
    view.setPathRepository(_repository.getPathFile());
  }



}
