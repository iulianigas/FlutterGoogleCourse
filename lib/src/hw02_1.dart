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
  TextEditingController controller = TextEditingController();
  int randomNumber = Random().nextInt(100);
  String? message;

  checkAnswer(int answerNumber) {
    setState(() {
      if (answerNumber == randomNumber) {
        message = 'It is $randomNumber, Congratulations!';
      } else if (answerNumber < randomNumber) {
        message = 'The number is greater!';
      } else {
        message = 'Try smaller number!';
      }
      controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guess my number'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const Text(
              'I am thinking of a number between 1 and 100.',
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'Raleway', fontSize: 20),
            ),
            const Text(
              "It's your turn to guess my number!",
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'Raleway', fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(hintText: 'Type your guess'),
                keyboardType: TextInputType.number,
              ),
            ),
            Text(
              '$message',
              style: TextStyle(fontSize: 15),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: ElevatedButton(
                child: Text('Guess'),
                onPressed: () {
                  checkAnswer(int.parse(controller.text));
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}

