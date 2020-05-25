import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:highwave/registerPage.dart';
import 'package:highwave/signInPage.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _button(action, text) {
      return RaisedButton(
        onPressed: () => {
          Navigator.of(context).push(
              new MaterialPageRoute(builder: (context) => new RegisterPage()))
        },
        padding: EdgeInsets.symmetric(vertical: 16.0),
        elevation: 2.0,
        color: const Color.fromRGBO(224, 130, 132, 1.0),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(23.0)),
        child: new Text(
          text.toUpperCase(),
          style: new TextStyle(
            color: Colors.white,
            fontSize: 15.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _button({}, 'sign in'),
          _button({}, 'register')
        ],
      ),
    );
  }
}
