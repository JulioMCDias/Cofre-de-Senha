import 'package:cofresenha/generated/l10n.dart';
import 'package:flutter/material.dart';

class TextFormFieldPassword extends StatefulWidget {
  final TextEditingController controller;
  final Color color;
  final bool passwordVisible;
  final bool editable;
  final TextAlign textAlign;
  final String errorText;

  TextFormFieldPassword({
    @required this.color,
    @required this.controller,
    this.errorText,
    this.passwordVisible = false,
    this.editable = false,
    this.textAlign = TextAlign.start});

  @override
  _TextFormFieldPasswordState createState() => _TextFormFieldPasswordState(!passwordVisible);
}


class _TextFormFieldPasswordState extends State<TextFormFieldPassword> {

  bool _passwordVisible;
  _TextFormFieldPasswordState(this._passwordVisible);


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: widget.textAlign,
      style: TextStyle(color: widget.color, fontSize: 18),
      keyboardType: TextInputType.text,
      controller: widget.controller,
      readOnly: widget.editable,
      obscureText: _passwordVisible,
      decoration: InputDecoration(
        errorText: widget.errorText,
        labelText: S.of(context).fieldPassword,
        labelStyle: TextStyle(fontSize:20, color: Theme.of(context).primaryColor),
        hintText: S.of(context).hintPassword,
        hintStyle: TextStyle(color: Theme.of(context).primaryColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 2, color:  Theme.of(context).primaryColor)
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 2,
            color:  Theme.of(context).primaryColor)
        ),
        // Here is key idea
        suffixIcon: IconButton(
          icon: Icon(
            _passwordVisible
              ? Icons.visibility
              : Icons.visibility_off,
            color: widget.color,
          ),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
      ),
    );
  }
}


