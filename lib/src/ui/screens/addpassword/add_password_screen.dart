
import 'package:cofresenha/generated/l10n.dart';
import 'package:cofresenha/src/ui/screens/addpassword/add_password_bloc.dart';
import 'package:cofresenha/src/ui/widget/background_decoration.dart';
import 'package:cofresenha/src/ui/widget/custom_text_filder.dart';
import 'package:cofresenha/src/ui/widget/text_form_field_password.dart';
import 'package:flutter/material.dart';

class AddPasswordScreen extends StatefulWidget {
  final AddPasswordBloc _bloc;
  AddPasswordScreen(this._bloc);

  @override
  _AddPasswordScreenState createState() => _AddPasswordScreenState();
}

class _AddPasswordScreenState extends State<AddPasswordScreen> {
  AddPasswordBloc _bloc;

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
        centerTitle: true,
          title: Text(S.of(context).titleNewPassword,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
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
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: StreamBuilder(
                    stream: _bloc.streamValidateTitle,
                    initialData: null,
                    builder:(context, validate) => CustomTextField(
                      errorText: validate.data,
                      labelText: S.of(context).fieldTitlePassword,
                      controller: _bloc.textEditingTitle,
                      fontSize: 20,
                      borderColor: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: CustomTextField(
                    labelText: S.of(context).fieldName,
                    controller: _bloc.textEditingName,
                    fontSize: 20,
                    borderColor: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).primaryColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: StreamBuilder(
                    stream: _bloc.streamValidateEmail,
                    initialData: null,
                    builder:(context, validate) => CustomTextField(
                      errorText: validate.data,
                      labelText: S.of(context).fieldEmail,
                      controller: _bloc.textEditingEmail,
                      fontSize: 20,
                      borderColor: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 32),
                  child: StreamBuilder(
                    stream: _bloc.streamValidatePassword,
                    initialData: null,
                    builder:(context, validate) => TextFormFieldPassword(
                      errorText: validate.data,
                      color: Theme.of(context).primaryColor,
                      controller: _bloc.textEditingPassword
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: CustomTextField(
                    minLines: 8, maxLines: 15, fontSize: 20,
                    labelText: S.of(context).fieldDescription,
                    controller: _bloc.textEditingDescription,
                    borderColor: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save, color: Colors.indigo,),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => _bloc.btnSave(),
      ),
    );
  }


  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
