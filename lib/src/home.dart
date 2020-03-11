import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_cone/src/screens/contacts.tab.dart';
import 'package:whatsapp_cone/src/screens/conversations.tab.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TabController _tabController;
  String userEmail;

  Future<FirebaseUser> getLogedUser() async {
    FirebaseUser user = await firebaseAuth.currentUser();
    setState(() {
      userEmail = user.email;
    });

    return user;
  }

  @override
  void initState() {
    super.initState();
    getLogedUser();

    _tabController = TabController(length: 2, vsync: this);
    //firebaseAuth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp"),
        bottom: TabBar(
          indicatorWeight: 4,
          indicatorColor: Colors.white,
          labelStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              text: "Conversas",
            ),
            Tab(
              text: "Contatos",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          ContactsTab(),
          ConversationsTab(),
        ],
      ),
    );
  }
}
