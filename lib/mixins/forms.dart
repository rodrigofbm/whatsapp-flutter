import 'package:flutter/material.dart';

abstract class Forms {
  Widget textInput(String hint,
      {TextInputType keyboardType,
      bool obscure,
      TextEditingController controller}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: TextField(
        controller: controller,
        autofocus: true,
        obscureText: obscure ?? false,
        keyboardType: keyboardType,
        style: TextStyle(fontSize: 20.0),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
            hintText: hint,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
            )),
      ),
    );
  }

  Widget primaryButton({Function btnPressed(), String label}) {
    return Padding(
      padding: EdgeInsets.only(top: 8, bottom: 10),
      child: RaisedButton(
        onPressed: () {
          btnPressed();
        },
        padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
        color: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
