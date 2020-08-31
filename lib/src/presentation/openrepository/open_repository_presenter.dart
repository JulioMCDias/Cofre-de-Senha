
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
  void openRepository(String password) async{
    view.loadingVisibility(true);

    _repository.openRepository(password).then((_) {
      view.loadingVisibility(false);
      view.navigationListBook();
    }).catchError((e){
      view.loadingVisibility(false);
      view.infoError(e.toString());
    });

  }

  void init() {
    view.setPathRepository(_repository.getPathFile());
  }



}
