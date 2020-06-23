import 'package:cofresenha/generated/l10n.dart';
import 'package:flutter/material.dart';

class TextFromFieldPassword extends StatefulWidget {
  final TextEditingController controller;
  final Color color;
  final bool passwordVisible;
  final bool editable;
  final TextAlign textAlign;

  TextFromFieldPassword(
    this.color,
    this.controller,
    {this.passwordVisible = false,
      this.editable = false,
      this.textAlign = TextAlign.start,
    });

  @override
  _TextFromFieldPasswordState createState() => _TextFromFieldPasswordState(!passwordVisible);
}


class _TextFromFieldPasswordState extends State<TextFromFieldPassword> {

  bool _passwordVisible;
  _TextFromFieldPasswordState(this._passwordVisible);


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


