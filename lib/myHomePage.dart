import 'package:flutter/material.dart';
import 'package:highwave/referenceList.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _helloText() {
    return Text(
      'Hello \nSowmya',
      style: Theme.of(context).textTheme.headline4,
    );
  }

  _conchs() {
    return Hero(
        tag: 'conchs',
        child: Row(
          children: <Widget>[
            Container(height: 20, width: 20, color: Colors.blue),
            Container(height: 20, width: 20, color: Colors.yellow),
            Container(height: 20, width: 20, color: Colors.green)
          ],
        ));
  }

  _overView() {
    return Column(
      children: <Widget>[
        Hero(
            tag: 'profilePic',
            child: Container(height: 40, width: 40, color: Colors.pink)),
        _conchs()
      ],
    );
  }

  _courseBox(course) {
    return Container (
      child: Column (
        children: <Widget>[
          Image (
            image: new AssetImage(course["image"]),
            height: 80.0,
            width: 80.0,
          ),
          Text(
            course["name"],
            textAlign: TextAlign.center,
            style: new TextStyle(
              letterSpacing: 1.0,
              fontWeight: FontWeight.w700,
              fontSize: 15.0,
              color: Colors.black54,
            ),
          ),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[_helloText(), _overView()],
          ),
        ),
        Text(
          'BGCSE',
          style: Theme.of(context).textTheme.headline4,
        ),
        GridView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: bjcCourses.length,
            itemBuilder: (BuildContext context, int index) =>
                _courseBox(bjcCourses[index])),
        Text(
          'BJC',
          style: Theme.of(context).textTheme.headline4,
        ),
        GridView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: bjcCourses.length,
            itemBuilder: (BuildContext context, int index) =>
                _courseBox(bgcseCourses[index])),
      ],
    ));
  }
}
