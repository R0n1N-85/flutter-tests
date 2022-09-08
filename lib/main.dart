import 'dart:developer';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'Counter App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementNumber() {
    setState(() {
      _counter++;
    });
  }

  void _decrementNumber() {
    setState(() {
      _counter--;
    });
  }

  void _resetNumber() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Please choose from below options',
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
            ),
            Text(
              key: const Key('counterNumber'),
              '$_counter',
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 40),
            ),
            new Container(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FloatingActionButton(
                    key: const Key('plusButton'),
                    onPressed: _incrementNumber,
                    tooltip: 'Increment',
                    child: const Icon(Icons.arrow_circle_up),
                  ),
                  FloatingActionButton(
                    key: const Key('minusButton'),
                    onPressed: _decrementNumber,
                    tooltip: 'Decrement',
                    child: const Icon(Icons.arrow_circle_down),
                  ),
                  FloatingActionButton(
                    key: const Key('resetButton'),
                    onPressed: _resetNumber,
                    tooltip: 'Reset the count',
                    child: const Icon(Icons.reset_tv),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
