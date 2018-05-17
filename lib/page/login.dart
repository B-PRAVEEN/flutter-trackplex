import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  static String tag = 'loginPage';
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
        tag: 'loginpage',
        child: new Padding(
          padding: EdgeInsets.all(50.0),
          child: Image.network(
            'http://app.trackplex.com/img/logo.png',
            width: 200.0,
            height: 50.0,
          ),
        ));
    final form = new Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new TextFormField(
            style: new TextStyle(color: Colors.white),
            autovalidate: true,
            decoration: new InputDecoration(
              icon: new Icon(Icons.email),
              labelText: "Email ID",
              labelStyle: TextStyle(color: Colors.white),
            ),
          ),
          new TextFormField(
            style: new TextStyle(color: Colors.white),
            autovalidate: true,
            obscureText: true,
            decoration: new InputDecoration(
              icon: new Icon(Icons.lock_outline),
              labelText: "Password",
              labelStyle: TextStyle(color: Colors.white),
            ),
          ),
          new Padding(
            padding: EdgeInsets.all(20.0),
            child: new RaisedButton.icon(
              color: Colors.blueAccent,
              label: new Text("Login"),
              icon: new Icon(Icons.local_shipping),
              onPressed: () {},
            ),
          )
        ],
      ),
    );

    return new Scaffold(
      backgroundColor: Colors.green,
      body: Center(
          child: new Padding(
        padding: EdgeInsets.all(34.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[logo, form],
        ),
      )),
    );
  }
}
