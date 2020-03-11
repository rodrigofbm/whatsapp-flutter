import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_cone/mixins/forms.dart';
import 'package:whatsapp_cone/src/cadastrate.dart';
import 'package:whatsapp_cone/src/models/usuario.model.dart';

import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with Forms {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();

  Future verifyUserLoged() async {
    FirebaseUser user = await firebaseAuth.currentUser();

    if (user != null)
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  void initState() {
    super.initState();
    verifyUserLoged();
  }

  login() {
    Usuario user = Usuario("", _controllerEmail.text, _controllerPassword.text);

    firebaseAuth
        .signInWithEmailAndPassword(email: user.email, password: user.password)
        .then((user) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    }).catchError(print);
  }

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
                textInput("E-mail",
                    keyboardType: TextInputType.emailAddress,
                    controller: _controllerEmail),
                textInput("Password",
                    obscure: true, controller: _controllerPassword),
                Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 10),
                  child: RaisedButton(
                    onPressed: () {
                      login();
                    },
                    padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Text(
                      "Log In",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
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
