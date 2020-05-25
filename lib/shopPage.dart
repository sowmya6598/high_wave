import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
        body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                elevation: 0.0,
                leading: new IconButton(
                    icon: new Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.popUntil(context, ModalRoute.withName('/'))
                ),
              ),
            ]
        )
    );
  }
}