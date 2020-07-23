import 'dart:async';

class SplashBloc {

  bool _move = false;
  bool get move => _move;
  double _opacityLevel = 0;
  double get opacityLevel => _opacityLevel;

  final _blocMove = StreamController<bool>();
  Stream<bool> get streamMove => _blocMove.stream;

  final _blocOpacityLevel = StreamController<double>();
  Stream<double> get streamOpacityLevel => _blocOpacityLevel.stream;

  SplashBloc() {

    Future.delayed(Duration(seconds: 1))
      .then((value) {
        _move = true;
        _blocMove.sink.add(_move);
      }
      );

    Future.delayed(Duration(seconds: 2))
      .then((value){
        _opacityLevel = 1;
        _blocOpacityLevel.sink.add(_opacityLevel);
      });
  }

  void dispose(){
    _blocMove.close();
    _blocOpacityLevel.close();
  }

}