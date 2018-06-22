import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:validate/validate.dart';
import 'package:crypto/crypto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _Logindata {
  String email = '';
  String password = '';
}

class _LoginState extends State<Login> {
  @override
  final GlobalKey<FormState> _loginFormKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffloadKey = GlobalKey<ScaffoldState>();

  _Logindata _data = new _Logindata();

  String _emailValidator(String value) {
    try {
      Validate.isEmail(value);
    } catch (e) {
      return 'The E-mail Address must be a valid email address.';
    }

    return null;
  }

  String _passwordValidator(String password) {
    if (password.isNotEmpty) {
      return null;
    } else {
      return 'Password is required.';
    }
  }

  void _submit() {
    final loginForm = _loginFormKey.currentState;
    if (loginForm.validate()) {
      loginForm.save();
      _perfromLogin();
    } else {}
  }

  void _perfromLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Future<bool> savedToLocal;
    var passwordUtf = new Utf8Encoder().convert(this._data.password);

    var password = md5.convert(passwordUtf).toString();

    Map<String, String> lHeaders = {
      "Content-type": "application/json",
      "Accept": "application/json"
    };
    Map<String, String> body = {
      "email": this._data.email,
      "password": password
    };
    String lData = JSON.encode(body);
    http
        .post("http://app.trackplex.com/api/login",
            body: lData, headers: lHeaders)
        .then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      prefs.setString("login", response.body);

      final toast = new SnackBar(content: new Text('Welcome to Trackplex RTO'));
      _scaffloadKey.currentState.showSnackBar(toast);
    });
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      key: this._scaffloadKey,
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
                  key: this._loginFormKey,
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
                            validator: (val) => _emailValidator(val),
                            onSaved: (val) => this._data.email = val,
                          ),
                          new TextFormField(
                            decoration: new InputDecoration(
                                labelText: "Account Password"),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            validator: (val) => _passwordValidator(val),
                            onSaved: (val) => this._data.password = (val),
                          ),
                          new Expanded(
                            child: new Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: new MaterialButton(
                                onPressed: _submit,
                                child: Text("Login"),
                                elevation: 4.0,
                                splashColor: Colors.blueGrey,
                                color: Theme.of(context).accentColor,
                                colorBrightness: Brightness.dark,
                              ),
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
