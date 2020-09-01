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
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _bloc = widget._bloc;
    _bloc.initState(context);

    _bloc.infoError = (String value) {
      final snack = SnackBar(
        content: Text(value), duration: Duration(seconds: 2));
      _scaffoldKey.currentState.removeCurrentSnackBar();
      _scaffoldKey.currentState.showSnackBar(snack);
    };

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        decoration: BackgroundDecoration(),
        height: double.infinity,
        child: Stack(
          children:[
            LoadingVisibility(_bloc.streamLoadingVisibility),

            Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 45),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    onPressed: () => _bloc.btnOpenRepository(),
                    elevation: 5,
                    padding: EdgeInsets.all(18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
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
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16.0),
                    height: 180,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    child: StreamBuilder<List<String>>(
                      stream: _bloc.streamListRepository,
                      initialData: [],
                      builder: (context, list){
                        return ListView.builder(
                          padding: EdgeInsets.all(10),
                          itemCount: list.data.length,
                          itemBuilder: (context, index){
                            return _pathCard(context, list.data[index], index);
                          },
                        );
                      },
                    ),
                  ),
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

                  StreamBuilder<String>(
                    initialData: null,
                    stream: _bloc.streamValidatePassword,
                    builder:(context, snapshot) {
                      return TextFormFieldPassword(
                        errorText: snapshot.data,
                        color: Theme.of(context).primaryColor,
                        controller: _bloc.textEditingPassword,
                      );
                    }
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
                      onPressed: () => _bloc.btnOpen(),

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
                                    S.of(context).btnOpen,
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
          )
          ],
        ),
      ),
    );
  }



  // ---------------- card -----------------
  Widget _pathCard(context, String path, index){
    return GestureDetector(
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.delete, color: Colors.indigo),
              padding: const EdgeInsets.only(left: 4.0, right: 18.0),
              onPressed: (){
                _bloc.btnRemovePath(path, index);
                final snack = SnackBar(
                  content: Text(path),
                  action: SnackBarAction(label: S.of(context).infoUndo,
                    onPressed: (){
                      _bloc.btnRestoreItemPath();
                    },),
                  duration: Duration(seconds: 2),
                );
                Scaffold.of(context).removeCurrentSnackBar();
                Scaffold.of(context).showSnackBar(snack);
              },
            ),

            Flexible(
              child: Text(path,
                style: TextStyle(color: Colors.indigo, fontSize: 16),
              ),
            ),
          ]
        ),
      ),
      onTap: ()=> _bloc.btnItemPath(path),
    );
  }
  // ---------


  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}