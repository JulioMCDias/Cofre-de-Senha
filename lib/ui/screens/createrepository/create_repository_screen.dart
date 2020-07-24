import 'package:cofresenha/generated/l10n.dart';
import 'package:cofresenha/ui/screens/createrepository/create_repository_bloc.dart';
import 'package:cofresenha/ui/screens/createrepository/create_repository_controller.dart';
import 'package:cofresenha/ui/widget/background_decoration.dart';
import 'package:cofresenha/ui/widget/text_form_field_password.dart';
import 'package:cofresenha/utils/constants.dart' as Constants;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';


class CreateRepositoryScreen extends StatefulWidget {
  @override
  _CreateRepositoryScreenState createState() => _CreateRepositoryScreenState();
}

class _CreateRepositoryScreenState extends StateMVC<CreateRepositoryScreen> {
  CreateRepositoryBloc _bloc;
  CreateRepositoryCon con;

  _CreateRepositoryScreenState(): super(CreateRepositoryCon()){
    _bloc = CreateRepositoryBloc();
    con = (controller as CreateRepositoryCon);
    con.bloc = _bloc;
  }

  TextEditingController _textEditingPassword = TextEditingController();
  TextEditingController _textEditingNameFile = TextEditingController();


  @override
  void initState() {
    _textEditingNameFile.text = "${Constants.NAME_FILE}.${Constants.TYPE_FILE}";
    con.openDirectoryPath();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BackgroundDecoration(),
        height: double.infinity,
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 25, horizontal: 45),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    children: [
                      Text(S.of(context).infoRepository,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        textAlign: TextAlign.left,
                      ),
                       Expanded(
                         child: Padding(
                           padding: const EdgeInsets.only(left: 8.0),
                           child: StreamBuilder<String>(
                              stream: _bloc.streamPathRepository,
                              initialData: "",
                              builder: (context, snapshot){
                                return  Text(snapshot.data,
                                    style: TextStyle(fontSize: 16, color: Colors.white),
                                );},
                        ),
                         ),
                       )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right:12.0),
                            child: Text(S.of(context).infoFileName,
                                  textAlign: TextAlign.end,
                                  style: TextStyle(fontSize: 22, color: Colors.white),
                                ),
                            ),
                          ),
                        Expanded(
                          child: StreamBuilder<String>(
                            initialData: null,
                            stream: _bloc.streamValidateName,
                            builder:(context, snapshot) {
                              return TextFormField(
                                style: TextStyle(
                                  fontSize: 18, color: Colors.white),
                                controller: _textEditingNameFile,
                                decoration: InputDecoration(
                                  errorText: snapshot.data,
                                  contentPadding: const EdgeInsets.only(
                                    left: 8.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      width: 2, color: Theme
                                      .of(context)
                                      .primaryColor)
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: Theme
                                        .of(context)
                                        .primaryColor)
                                  ),
                                ),
                              );
                            }
                          ),
                        ),
                      ],
                    ),
                ),
                StreamBuilder<String>(
                  initialData: null,
                  stream: _bloc.streamValidatePassword,
                  builder:(context, snapshot) {
                  return TextFormFieldPassword(
                    errorText: snapshot.data,
                    color: Theme.of(context).primaryColor,
                    controller: _textEditingPassword,
                  );}
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
                    onPressed: () {
                      if(_bloc.validatePassword(context, _textEditingPassword.value.text) &
                      _bloc.validateNameFile(context, _textEditingNameFile.value.text)) {
                        con.createRepository(_textEditingPassword.value.text,
                          _textEditingNameFile.value.text);
                      }
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
      ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
