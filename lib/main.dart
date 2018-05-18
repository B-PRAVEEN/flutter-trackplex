import 'package:flutter/material.dart';
import 'package:trackplex_rto/page/login.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Login(),
      theme: new ThemeData(
        primarySwatch: Colors.blue
      ),
    );
  }
}
