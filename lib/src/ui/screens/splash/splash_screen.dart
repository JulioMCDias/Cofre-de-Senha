import 'package:cofresenha/generated/l10n.dart';
import 'package:cofresenha/src/ui/screens/splash/splash_bloc.dart';
import 'package:cofresenha/src/ui/widget/background_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  final SplashBloc _bloc;
  SplashScreen(this._bloc);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashBloc _bloc;

  @override
  void initState() {
    _bloc = widget._bloc;
    _bloc.context = context;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BackgroundDecoration(),
        height: double.infinity,
        child: Center(
          child: Stack(
            overflow: Overflow.clip,
            alignment: AlignmentDirectional.center,
            children: [
            StreamBuilder<bool>(
            stream: _bloc.streamMove,
            initialData: false,
            builder: (context, move){
              return AnimatedPositioned(
                  duration: Duration(seconds: 1),
                  top: move.data ? 10 : 150,
                  bottom: move.data ? 150 : 10,
                  curve: Curves.fastOutSlowIn,
                  child: Container(
                    padding: EdgeInsets.only(left: 80, right: 80, bottom: 100),
                    child: SvgPicture.asset(
                      "assets/icons/cofre.svg",
                      width: 200,
                    ),
                  ),
                );
            }),
              StreamBuilder<double>(
                stream: _bloc.streamOpacityLevel,
                initialData: 0,
                builder: (context, snapshot){
                  return AnimatedOpacity(
                    opacity: snapshot.data,
                    duration: Duration(seconds: 1),
                    child: Container(
                      padding: EdgeInsets.only(top: 150),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            S.of(context).infoOpenRepository,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.amber,
                            ),
                          ),
                          Container(
                            margin:
                            EdgeInsets.symmetric(vertical: 25, horizontal: 45),
                            width: double.infinity,
                            child: RaisedButton(
                              onPressed: () => _bloc.btnOpenRepository(),

                              elevation: 5,
                              padding: EdgeInsets.all(14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                              color: Colors.white,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Stack(
                                      children: [
                                        Icon(Icons.folder, color: Colors.indigo),
                                        Center(
                                          child: Text(
                                            S.of(context).btnOpenRepository,
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.indigo
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 45),
                            width: double.infinity,
                            child: RaisedButton(
                              onPressed: () => _bloc.btnNewRepository(),

                              elevation: 5,
                              padding: EdgeInsets.all(14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                              color: Colors.white,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Stack(
                                      children: [
                                        Icon(Icons.note_add, color: Colors.indigo),
                                        Center(
                                          child: Text(
                                            S.of(context).btnNewRepository,
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.indigo
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                  },
              ),
              CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
