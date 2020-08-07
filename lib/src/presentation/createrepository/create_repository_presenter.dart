
import 'package:cofresenha/src/data/help_file.dart';
import 'package:cofresenha/src/data/repository.dart';
import 'package:cofresenha/src/presentation/createrepository/create_repository_view.dart';
import 'package:cofresenha/src/ui/screens/createrepository/create_repository_bloc.dart';

class CreateRepositoryPresenter{
  CreateRepositoryView view;
  final _repository = Repository();
  final _helpFile = HelpFile();

  CreateRepositoryPresenter(){
    view = CreateRepositoryBloc(this);
  }


  // ------------- CreateRepositoryPresenter -------------------
  String _path;

  void openDirectoryPath(){
    _helpFile.openDirectoryPath().then((value){
      if(value == null) {
        _helpFile.localPath().then((value){
          _path = value;
          view.setPathRepository(value);
        });

      }else {
        _path = value;
        view.setPathRepository(value);
      }
    });
  }

  void createRepository(String password, String nameFile){
    _helpFile.createFile(nameFile, _path).then((file){
      _repository.setFile(file);
      view.navigationListBook();
    });
  }

}
