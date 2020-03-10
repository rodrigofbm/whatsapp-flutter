import 'package:flutter/material.dart';
import 'package:whatsapp_cone/mixins/forms.dart';
import 'package:whatsapp_cone/src/cadastrate.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with Forms {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff075E54),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 32.0),
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: 200,
                    height: 150,
                  ),
                ),
                textInput("E-mail", keyboardType: TextInputType.emailAddress),
                textInput("Password", obscure: true),
                primaryButton(label: "Log In"),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Cadastrate(),
                          ));
                    },
                    child: Text(
                      "Não tem conta? Cadastre-se!",
                      style: TextStyle(
                        color: Colors.white,
                      ),
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
}
