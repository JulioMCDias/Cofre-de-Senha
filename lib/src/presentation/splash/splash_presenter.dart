import 'package:cofresenha/src/data/help_file.dart';
import 'package:cofresenha/src/data/repository.dart';
import 'package:cofresenha/src/presentation/splash/splash_view.dart';
import 'package:cofresenha/src/ui/screens/splash/splash_bloc.dart';
import '../../utils/constants.dart' as Constants;

class SplashPresenter{
  SplashView view;
  Repository _repository;
  final _helpFile = HelpFile();

  SplashPresenter({Repository repository}){
    _repository = repository == null ? Repository(): repository;
    view = SplashBloc(this);
  }


  void newRepository(){
    _helpFile.createFile(
      Constants.EXTENSION_FILE,
      Constants.NAME_FILE).then((file) {
        if (file != null) {
          _repository.setFile(file);
          view.navigationNewRepository();
        }
      }).catchError((e){
        view.infoError(e.toString());
    });

  }

  void openRepository(){
    _helpFile.openFile().then((file) {
      if(file != null) {
        _repository.setFile(file);
        view.navigationOpenRepository();
      }
    }).catchError((e){
      view.infoError(e.toString());
    });
  }
}