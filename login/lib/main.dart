import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(new FlutterView());
}

class FlutterView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter View',
      theme: new ThemeData(
        primarySwatch: Colors.grey,
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
  static const String _channel = 'increment';
  static const String _pong = 'pong';
  static const String _emptyMessage = '';
  static const BasicMessageChannel<String> platform =
      const BasicMessageChannel<String>(_channel, const StringCodec());

  int _counter = 0;

  @override
  void initState() {
    super.initState();
    platform.setMessageHandler(_handlePlatformIncrement);
  }

  Future<String> _handlePlatformIncrement(String message) async {
    setState(() {
      _counter++;

    });
    return _emptyMessage;
  }

  void _sendFlutterIncrement() {
    platform.send(_pong);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          /*new Expanded(
            child: new Center(
              child: new Text(
                'Platform button tapped $_counter time${ _counter == 1 ? '' : 's' }.',
                style: const TextStyle(fontSize: 17.0))
            ),
          ),*/
          new Container(
            padding: const EdgeInsets.only(bottom: 15.0, left: 5.0),
            margin: const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 45.0, top: 400.0),
            child: new Center(
              child: new Column(
                children: <Widget>[
                  new Container(
                    decoration: new BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: new BorderRadius.only(
                          bottomLeft:  const  Radius.circular(15.0),
                          bottomRight: const  Radius.circular(15.0)
                          )
                    ),
                    child: new Column(
                      children: <Widget>[
                        const Text('Please enter your national ID', style: const TextStyle(fontSize: 20.0)),
                        new TextField(
                          decoration: InputDecoration(
                          hintText: 'Enter ID'
                          )
                        ),
                        new Container(
                          decoration: new BoxDecoration(
                            color: Colors.blue,
                            borderRadius: new BorderRadius.only(
                                bottomLeft:  const  Radius.circular(15.0),
                                bottomRight: const  Radius.circular(15.0)
                                )
                          ),
                          margin: const EdgeInsets.only(top: 5.5),
                          width: double.infinity,
                          child: new RaisedButton(
                            child: new Text("NEXT"), 
                            onPressed: null,
                          ),
                        ),
                      ],
                    )

                  ),
                ],
              ),
            ), 
          ),
          new Container(
            color: Colors.white,
            child: new Center(
              child: new Row(
                children: <Widget>[
                  new Row(  
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.only(left: 5.0),
                        child: const Text('Powered By', style: const TextStyle(fontSize: 10.0)),
                      ),
                      new Container(
                        width: 4.0, 
                      ),
                      new Container(
                        child: const Text('Dopravo', style: const TextStyle(fontSize: 10.0)),
                      ),
                    ],
                  ),
                  new Container(
                    width: MediaQuery.of(context).size.width*0.46,
                  ),
                  new Row(  
                    children: <Widget>[
                      new Container(
                        child: const Text('Need help?', style: const TextStyle(fontSize: 10.0)),
                      ),
                      new Container(
                        width: 4.0, 
                      ),
                      new Container(
                        margin: const EdgeInsets.only(right: 0.0),
                        child: const Text('Contact us', style: const TextStyle(fontSize: 10.0)),
                      ),
                    ],
                  ),
                ],
              ),
            ), 
          ),
        ],
      ),
    );
  }
}
