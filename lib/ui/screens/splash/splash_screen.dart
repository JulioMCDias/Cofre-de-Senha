import 'package:cofresenha/generated/l10n.dart';
import 'package:cofresenha/ui/screens/openrepository/open_repository_screen.dart';
import 'package:cofresenha/ui/screens/splash/splash_bloc.dart';
import 'package:cofresenha/ui/widget/background_decoration.dart';
import 'package:cofresenha/data/help_file.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../createrepository/create_repository_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashBloc bloc = SplashBloc();

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
            stream: bloc.streamMove,
            initialData: false,
            builder: (context, snapshot){
              return AnimatedPositioned(
                  duration: Duration(seconds: 1),
                  top: bloc.move ? 10 : 150,
                  bottom: bloc.move ? 150 : 10,
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
                stream: bloc.streamOpacityLevel,
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
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                      OpenRepositoryScreen()));
                              },
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
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                      CreateRepositoryScreen()));
                              },
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

            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}
