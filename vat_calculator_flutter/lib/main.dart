
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _textController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("VAT Calculator"),
      ),
      body: Center(
        child: new ListView(
          children: <Widget>[
            new ListTile(
              title: new TextField(
                textAlign: TextAlign.center,
                controller: _textController,
              ),
            ),
            new ListTile(
              title: new RaisedButton(
                child: new Text("Result"),
                onPressed: () {
                  var route = new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new ResultPage(value: _textController.text),
                  );
                  Navigator.of(context).push(route);
                },
              ),
            ),
          ],
      ),
    ),
    );
  }

/*
    @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("VAT Calculator"),
      ),
      body: Center(
        child: new Column(
          children: <Widget> [
            new TextField(
                controller: _textController,
              ),
            new RaisedButton(
                child: new Text("Result"),
                onPressed: () {
                  var route = new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new ResultPage(value: _textController.text),
                  );
                  Navigator.of(context).push(route);
                },
              ),

        ]
        ),
        
    ),
    );
  }*/
  
}

class ResultPage extends StatefulWidget {
  final String value;

  ResultPage({Key key, this.value}) : super(key: key);

  @override
  _ResultPageState createState() => new _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Result"),
      ),
      body: Center (
        child: new Text("${0.05 * int.parse(widget.value)}"),
      ),
    );
  }
}