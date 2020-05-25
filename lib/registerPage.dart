import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:highwave/myHomePage.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {

    _textField (hintText, type, obscure) {
      return TextFormField(
        obscureText: obscure,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.fromLTRB(25.0, 10.0, 10.0, 20.0),
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      );
    }

    _dropDown () {
      return DropdownButton(

      );
    }

    _termsAndConditions () {
      return Row (

      );
    }

    final registerButton = new RaisedButton(
      onPressed: () {
        Navigator
            .of(context)
            .push(new MaterialPageRoute(builder: (context) => new MyHomePage()));
      },
      padding: EdgeInsets.symmetric(vertical: 16.0),
      elevation: 2.0,
      color: const Color.fromRGBO(224, 130, 132, 1.0),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(15.0)),
      child: new Text(
        'Register',
        style: new TextStyle(
          color: Colors.white,
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            _textField('First Name', {}, false),
            _textField('Last Name', {}, false),
            _textField('Email', {}, false),
            _textField('Password', {}, true),
            _textField('Confirm Password', {}, true),
            _dropDown(),
            _dropDown(),
            _termsAndConditions(),
            registerButton
          ],
        ),
      ),
    );
  }
}