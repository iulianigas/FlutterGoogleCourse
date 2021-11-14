import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:powers/powers.dart';

void main() {
  runApp(const FlutterApp());
}

class FlutterApp extends StatelessWidget {
  const FlutterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Number Shapes'),
      ),
      body: Column(
        children: <Widget> [
          const Text(
            'Please input a number to see if it is perfect square or perfect triangle',
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Raleway', fontSize: 20),
          ),
          Container(
            margin: EdgeInsetsDirectional.all(16.0),
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.check),
        onPressed: showMessage,
      ),
    );
  }

  void showMessage() {
    final String value = controller.text;
    final int titleValue = int.parse(value);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$titleValue'),
          content: Column(
            children: [
              if(titleValue.isSquare)
                Text('Number $titleValue is PERFECT SQUARE')
              else if(titleValue.isCube)
                Text('Number $titleValue is PERFECT TRIANGLE')
              else Text('Number $titleValue is NEITHER PERFECT SQUARE OR PERFECT TRIANGLE')
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

