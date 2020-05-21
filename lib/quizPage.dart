import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  bool answerSubmitted = false;
  bool showExplanation = false;
  int chosenAnswer;

  @override
  Widget build(BuildContext context) {
    _appBar() {
      return SliverAppBar(
        elevation: 0.0,
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () =>
                Navigator.popUntil(context, ModalRoute.withName('/'))),
      );
    }

    _button() {
      var buttonText = answerSubmitted ? 'Next Question' : 'Submit Answer';
      return RaisedButton(
        padding: EdgeInsets.all(10.0),
        child: Text(buttonText),
        onPressed: () {
          if (answerSubmitted)
            Navigator.of(context)
                .push(new MaterialPageRoute(builder: (context) => QuizPage()));
          setState(() {
            answerSubmitted = !answerSubmitted;
          });
        },
      );
    }

    _imageButton() {
      return Container(
          alignment: AlignmentDirectional(0.90, 0.0),
          decoration: new BoxDecoration(color: Colors.blue),
          child: GestureDetector(
              onTapDown: (_) => Image.asset("assets/picture.png", width: 50),
              child:IconButton(
                icon: Icon(Icons.add_a_photo),
              ))
          );
    }

    _questionArea() {
      return Container(
        height: 250.0,
        padding: EdgeInsets.all(40.0),
        decoration: new BoxDecoration(color: Colors.blue),
        child: Text("QUESTION GOES HERE",
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 22.0)),
      );
    }

    _answerOptions(index) {
      return FlatButton(
        padding:
            EdgeInsets.only(top: 40.0, bottom: 10.0, left: 20.0, right: 20.0),
        child: Material(
          borderRadius: BorderRadius.circular(17.0),
          shadowColor: Color.fromRGBO(50, 50, 50, 0.2),
          elevation: chosenAnswer == index ? 0.0 : 1.0,
          child: MaterialButton(
            color: chosenAnswer == index ? Color(0xFFF1BFB9) : Colors.white,
            minWidth: 300.0,
            height: 70.0,
            onPressed: () {
              setState(() {
                chosenAnswer = index;
              });
            },
            child: new Text("Answer 1",
                style: TextStyle(
                    color: Color(0xFFE08284),
                    fontWeight: FontWeight.w600,
                    fontSize: 25.0)),
          ),
        ),
      );
    }

    _summary() {
      return Container(
        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
        color: Color(0xFFF1BFB9),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Your Result",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0)),
            new Text("Incorrect",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 17.0)),
            new Text("Your Pace",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0)),
            new Text("2:09",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 17.0)),
          ],
        ),
      );
    }

    _explanation() {
      return Container(
          padding: const EdgeInsets.only(
              top: 40.0, bottom: 40.0, left: 30.0, right: 30.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("Explanation",
                    style: TextStyle(
                        color: Color(0xFFE08284),
                        fontWeight: FontWeight.w600,
                        fontSize: 25.0)),
                new Text(
                    "The heart is located at the center of the chest. Here, there is more information.",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color(0xFFE08284),
                        letterSpacing: 0.3,
                        fontWeight: FontWeight.w300,
                        fontSize: 17.0)),
              ]));
    }

    _areYouSure(BuildContext context) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: new Text('Are you sure?'),
              actions: <Widget>[
                new FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel')),
                new FlatButton(
                    onPressed: () {
                      // remove some conch
                      setState(() {
                        showExplanation = !showExplanation;
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text('Confirm'))
              ],
            );
          });
    }

    _overlay() {
      return Container(
        color: Colors.yellow.withOpacity(0.85),
        height: 200,
        width: 200,
        child: Column(
          children: <Widget>[
            Text('gotta use one conch to view this explanation'),
            FlatButton(
              onPressed: () => _areYouSure(context),
              child: Text('View Explanation'),
            )
          ],
        ),
      );
    }

    _explanationOverlay() {
      return Stack(
        children: <Widget>[_explanation(), if (!showExplanation) _overlay()],
      );
    }

    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        _appBar(),
        new SliverPadding(
          padding: new EdgeInsets.all(0.0),
          sliver: new SliverList(
            delegate: new SliverChildListDelegate([
              _questionArea(),
              _imageButton(),
              new Column(
                children: <Widget>[
                  _answerOptions(1),
                  _answerOptions(2),
                  _answerOptions(3),
                  _answerOptions(4)
                ],
              ),
              if (!answerSubmitted) _button(),
              answerSubmitted
                  ? Column(
                      children: <Widget>[
                        _summary(),
                        _explanationOverlay(),
                        if (answerSubmitted) _button()
                      ],
                    )
                  : new Container()
            ]),
          ),
        ),
      ]),
    );
  }
}
