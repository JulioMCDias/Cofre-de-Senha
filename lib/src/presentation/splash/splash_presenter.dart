import 'package:cofresenha/src/data/repository.dart';
import 'package:cofresenha/src/presentation/splash/splash_view.dart';
import 'package:cofresenha/src/ui/screens/splash/splash_bloc.dart';

class SplashPresenter{
  SplashView view;
  Repository _repository;

  SplashPresenter({Repository repository}){
    _repository = repository == null ? Repository(): repository;
    view = SplashBloc(this);
  }


  void newRepository(){
    view.navigationNewRepository();
  }

  void openRepository(){
    view.navigationOpenRepository();
  }
}