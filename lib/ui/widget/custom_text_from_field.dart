import 'package:flutter/material.dart';

class CustomTextFromField extends StatefulWidget {
  final controller;
  bool passwordVisible ;
  CustomTextFromField({
    this.controller,
    this.passwordVisible = false,
  });

  @override
  _CustomTextFromFieldState createState() => _CustomTextFromFieldState();
}

class _CustomTextFromFieldState extends State<CustomTextFromField> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 18),
      keyboardType: TextInputType.text,
      controller: widget.controller,
      obscureText: widget.passwordVisible,//This will obscure text dynamically
      decoration: InputDecoration(
        labelText: 'Senha',
        labelStyle: TextStyle(fontSize:20, color: Theme.of(context).primaryColor),
        hintText: 'Enter com a senha do repositorio',
        hintStyle: TextStyle(color: Theme.of(context).primaryColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color:  Theme.of(context).primaryColor)
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color:  Theme.of(context).primaryColor)),
        // Here is key idea
        suffixIcon: IconButton(
          icon: Icon(
            widget.passwordVisible
              ? Icons.visibility
              : Icons.visibility_off,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            setState(() {
              widget.passwordVisible = !widget.passwordVisible;
            });
          },
        ),
      ),
    );
  }
}


