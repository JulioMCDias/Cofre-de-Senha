import 'package:cofresenha/src/data/model/password.dart';
import 'package:cofresenha/src/ui/screens/listpassword/list_password_bloc.dart';
import 'package:cofresenha/src/ui/widget/background_decoration.dart';
import 'package:cofresenha/src/ui/widget/loading_visibility.dart';
import 'package:cofresenha/src/ui/widget/text_form_field_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListPasswordScreen extends StatefulWidget {
  final ListPasswordBloc _bloc;
  ListPasswordScreen(this._bloc);

  @override
  _ListPasswordScreenState createState() => _ListPasswordScreenState();
}

class _ListPasswordScreenState extends State<ListPasswordScreen> {
  ListPasswordBloc _bloc;

  @override
  void initState() {
    _bloc = widget._bloc;
    _bloc.initState(context);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: StreamBuilder(
          stream: _bloc.streamTitle,
          initialData: "",
          builder:(context, title) => Text(title.data,
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        decoration: BackgroundDecoration(),
        height: double.infinity,
        child: Stack(
          children: [
            loadingVisibility(_bloc.streamLoadingVisibility),

            Center(
              child: StreamBuilder(
                initialData: List<Password>(),
                stream: _bloc.streamListPassword,
                builder: (context, listPassword) => ListView.builder(
                  padding: EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 100),
                  itemCount: listPassword.data.length,
                  itemBuilder: (context, index){
                    return _passwordCard(listPassword.data[index]);
                  },
                ),
              )
            ),
          ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.indigo,),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: (){
          _bloc.btnAddPassword();
        },
      ),
    );
  }


  // -------------- card ----------------
  Widget _passwordCard(Password password){
    final _textEditingPassword = TextEditingController();
    _textEditingPassword.text = password.password;

    return GestureDetector(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        elevation: 5,
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(password.title, style: TextStyle(color: Colors.indigo, fontSize: 22),),
                  ),
                  Text(password.email, style: TextStyle(color: Colors.indigo, fontSize: 18)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 32),
                          child: Text(password.name,
                            style: TextStyle(color: Colors.indigo, fontSize: 18,),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Expanded(
                          child: TextFormFieldPassword(
                            color: Colors.indigo,
                            controller: _textEditingPassword,
                            editable: true,
                            textAlign: TextAlign.right,
                          )
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: (){
        _bloc.btnEditPassword(password);
      },
    );
  }


  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
