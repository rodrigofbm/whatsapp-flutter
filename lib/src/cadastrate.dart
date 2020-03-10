import 'package:flutter/material.dart';
import 'package:whatsapp_cone/mixins/forms.dart';

class Cadastrate extends StatefulWidget {
  @override
  _CadastrateState createState() => _CadastrateState();
}

class _CadastrateState extends State<Cadastrate> with Forms {
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();

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
                primaryButton(label: "Sign In"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
