import 'package:cofresenha/src/data/repository.dart';
import 'package:cofresenha/src/presentation/splash/splash_view.dart';
import 'package:cofresenha/src/ui/screens/splash/splash_bloc.dart';

class SplashPresenter{
  SplashView view;
  final _repository = Repository();

  SplashPresenter(){
    view = SplashBloc(this);
  }


  void newRepository(){

  }

  void openRepository(){
    view.navigationOpenRepository();
  }
}