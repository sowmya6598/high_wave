import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:highwave/myHomePage.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => new _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
          hintText: 'Email',
          contentPadding: EdgeInsets.fromLTRB(25.0, 10.0, 10.0, 20.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(23.0))),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(25.0, 10.0, 10.0, 20.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(23.0)),
      ),
    );

    final loginButton = new RaisedButton(
      onPressed: () {
        Navigator.of(context).push(
            new MaterialPageRoute(builder: (context) => new MyHomePage()));
      },
      padding: EdgeInsets.symmetric(vertical: 16.0),
      elevation: 2.0,
      color: const Color.fromRGBO(224, 130, 132, 1.0),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(23.0)),
      child: new Text(
        'Sign In',
        style: new TextStyle(
          color: Colors.white,
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot Password?',
        style: TextStyle(color: Colors.black54),
      ),
      padding: EdgeInsets.only(top: 13.0, bottom: 10.0),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[email, password, loginButton, forgotLabel],
      ),
    );
  }
}
