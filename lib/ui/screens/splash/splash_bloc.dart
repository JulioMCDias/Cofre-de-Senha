import 'dart:async';

class SplashBloc {

  final _blocMove = StreamController<bool>();
  Stream<bool> get streamMove => _blocMove.stream;

  final _blocOpacityLevel = StreamController<double>();
  Stream<double> get streamOpacityLevel => _blocOpacityLevel.stream;

  SplashBloc() {
    Future.delayed(Duration(seconds: 1))
      .then((value) => _blocMove.sink.add(true));

    Future.delayed(Duration(seconds: 2))
      .then((value) => _blocOpacityLevel.sink.add(1));
  }

  void dispose(){
    _blocMove.close();
    _blocOpacityLevel.close();
  }

}