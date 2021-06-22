import 'package:flutter/material.dart';
import 'package:scm_app/providers/auth.dart';
import 'package:scm_app/pages/loginPage.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed("/");
            // Provider.of<Auth>(context, listen: false).logout();
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Text("Logout"),
          color: Colors.green,
        ),
      ),
    );
  }
}
