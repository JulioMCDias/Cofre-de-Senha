import 'package:cofresenha/ui/widget/background_decoration.dart';
import 'package:cofresenha/ui/widget/custom_text_filder.dart';
import 'package:cofresenha/ui/widget/custom_text_from_field.dart';
import 'package:flutter/material.dart';

class AddPasswordScreen extends StatefulWidget {
  @override
  _AddPasswordScreenState createState() => _AddPasswordScreenState();
}

class _AddPasswordScreenState extends State<AddPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text( "Adicionar nova senha",
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
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: CustomTextField(
                      labelText: "Titulo",
                      fontSize: 20,
                      borderColor: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).primaryColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: CustomTextField(
                      labelText: "Name",
                      fontSize: 20,
                      borderColor: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).primaryColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: CustomTextField(
                      labelText: "Email",
                      fontSize: 20,
                      borderColor: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).primaryColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 32),
                    child: CustomTextFromField(
                      passwordVisible: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save, color: Colors.indigo,),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: (){
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
