import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new NetworkImage(
                "http://backgroundcheckall.com/wp-content/uploads/2017/12/code-background-image-2.jpg"),
            fit: BoxFit.fill,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image(
                image:
                    new NetworkImage("http://app.trackplex.com/img/logo.png"),
                fit: BoxFit.fill,
                width: 190.0,
              ),
              new Form(
                  child: new Theme(
                data: new ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.red,
                    inputDecorationTheme: new InputDecorationTheme(
                        labelStyle: new TextStyle(color: Colors.white))),
                child: new Container(
                  padding: EdgeInsets.all(34.0),
                  child: new Column(
                    children: <Widget>[
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Registered Email ID",
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      new TextFormField(
                        decoration:
                            new InputDecoration(labelText: "Account Password"),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                      new Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: new MaterialButton(onPressed: () {},
                         child: Text("Login"),
                         elevation: 4.0,
                         splashColor: Colors.blueGrey,
                         color: Theme.of(context).accentColor,
                         colorBrightness: Brightness.dark,
                        ),
                      )
                    ],
                  ),
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}
