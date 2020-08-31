import 'dart:async';

import 'package:cofresenha/src/presentation/createrepository/create_repository_presenter.dart';
import 'package:cofresenha/src/presentation/openrepository/open_repository_presenter.dart';
import 'package:cofresenha/src/presentation/splash/splash_presenter.dart';
import 'package:cofresenha/src/presentation/splash/splash_view.dart';
import 'package:cofresenha/src/ui/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';



class SplashBloc implements SplashView{
  @override SplashScreen screen;
  final SplashPresenter _presenter;
  BuildContext context;

  //----- construtor --------
  SplashBloc(this._presenter) {
    screen = SplashScreen(this);
    initAnimation();
  }


  // ----- informar erro ao usario ------
  @override
  Function(String) infoError;



  // ------------- StreamControllers -----------------
  final _blocMove = StreamController<bool>();
  Stream<bool> get streamMove => _blocMove.stream;

  final _blocOpacityLevel = StreamController<double>();
  Stream<double> get streamOpacityLevel => _blocOpacityLevel.stream;
  //---------




  //------------- functions -------------
  void initAnimation(){
    Future.delayed(Duration(seconds: 1))
      .then((value) => _blocMove.sink.add(true));

    Future.delayed(Duration(seconds: 2))
      .then((value) => _blocOpacityLevel.sink.add(1));
  }


  void btnNewRepository(){
    _presenter.newRepository();
  }


  void btnOpenRepository(){
    _presenter.openRepository();
  }


  @override
  void navigationNewRepository() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute( builder: (context) => CreateRepositoryPresenter().view.screen));
  }

  @override
  void navigationOpenRepository() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute( builder: (context) => OpenRepositoryPresenter().view.screen));
  }


  // ----- dispose -------
  void dispose(){
    _blocMove.close();
    _blocOpacityLevel.close();
  }
}