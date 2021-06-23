import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scm_app/pages/loginPage.dart';
import 'package:scm_app/providers/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: Auth(),
        child: MaterialApp(
          title: 'Supply Chain Management',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: LoginPage(),
        ));
  }
}
