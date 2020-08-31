import 'package:cofresenha/generated/l10n.dart';
import 'package:cofresenha/src/ui/screens/openrepository/open_repository_bloc.dart';
import 'package:cofresenha/src/ui/widget/background_decoration.dart';
import 'package:cofresenha/src/ui/widget/loading_visibility.dart';
import 'package:cofresenha/src/ui/widget/text_form_field_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OpenRepositoryScreen extends StatefulWidget {
  final OpenRepositoryBloc _bloc;
  OpenRepositoryScreen(this._bloc);

  @override
  _OpenRepositoryScreenState createState() => _OpenRepositoryScreenState();
}

class _OpenRepositoryScreenState extends State<OpenRepositoryScreen> {
  OpenRepositoryBloc _bloc;

  @override
  void initState() {
    _bloc = widget._bloc;
    _bloc.initState(context);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BackgroundDecoration(),
        height: double.infinity,
        child: Stack(
          children:[
            LoadingVisibility(_bloc.streamLoadingVisibility),

            Center(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 25, horizontal: 45),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(S.of(context).infoRepository,
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 16),
                      child: StreamBuilder<String>(
                        stream: _bloc.streamPathRepository,
                        initialData: "",
                        builder: (context, snapshot){
                          return  Text(snapshot.data,
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          );},
                      ),
                    ),

                    TextFormFieldPassword(
                      color: Theme.of(context).primaryColor,
                      controller: _bloc.textEditingPassword,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        StreamBuilder<bool>(
                          stream: _bloc.streamRememberPassword,
                          initialData: false,
                          builder: (context, snapshot){
                            return Checkbox(
                              value: snapshot.data,
                              checkColor: Colors.blue,
                              activeColor: Colors.white,
                              onChanged: (value) => _bloc.setRememberPassword(value),
                            );},
                        ),
                        Text(
                          S.of(context).checkBoxPassword,
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 25),
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () => _bloc.btnOpenRepository(),

                        elevation: 5,
                        padding: EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                        color: Colors.white,
                        child: Row(
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  Icon(
                                    Icons.folder_open,
                                    color: Colors.indigo,
                                  ),
                                  Center(
                                    child: Text(
                                      S.of(context).btnOpenRepository,
                                      style: TextStyle(fontSize: 20,
                                        color: Colors.indigo),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
          ],
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