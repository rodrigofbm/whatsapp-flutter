import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsapp_cone/mixins/forms.dart';
import 'package:whatsapp_cone/src/home.dart';
import 'package:whatsapp_cone/src/models/usuario.model.dart';

class Cadastrate extends StatefulWidget {
  @override
  _CadastrateState createState() => _CadastrateState();
}

class _CadastrateState extends State<Cadastrate> with Forms {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();

  cadastrate() {
    Usuario user = new Usuario(
        _controllerName.text, _controllerEmail.text, _controllerPassword.text);

    firebaseAuth
        .createUserWithEmailAndPassword(
            email: user.email, password: user.password)
        .then((firebaseUser) {
      Firestore db = Firestore.instance;

      db
          .collection("users")
          .document(firebaseUser.user.uid)
          .setData(user.toMap());

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => Home()),
        ModalRoute.withName('/'),
      );
    }).catchError(print);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
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
                    "assets/images/usuario.png",
                    width: 200,
                    height: 150,
                  ),
                ),
                textInput("Name", controller: _controllerName),
                textInput("E-mail",
                    controller: _controllerEmail,
                    keyboardType: TextInputType.emailAddress),
                textInput("Password",
                    controller: _controllerPassword, obscure: true),
                Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 10),
                  child: RaisedButton(
                    onPressed: () {
                      cadastrate();
                    },
                    padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
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
