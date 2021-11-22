import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

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
  AudioCache audioCache = AudioCache();
  AudioPlayer audioPlayer = AudioPlayer();

  List<String> textList = [
    'buna dimineata(engleza)',
    'buna seara(engleza)',
    'cum esti(japoneza)',
    'sunt bine(japoneza)',
    'numele meu este(franceza)',
    'la revedere(franceza)'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Basic phrases',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: textList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ElevatedButton(
            onPressed: () {
              switch (textList[index]) {
                case 'buna dimineata(engleza)':
                  {
                    audioCache.play('buna dimineata(engleza).mp3');
                  }
                  break;
                case 'buna seara(engleza)':
                  {
                    audioCache.play('buna seara(engleza).mp3');
                  }
                  break;
                case 'cum esti(japoneza)':
                  {
                    audioCache.play('cum esti(japoneza).mp3');
                  }
                  break;
                case 'sunt bine(japoneza)':
                  {
                    audioCache.play('sunt bine(japoneza).mp3');
                  }
                  break;
                case 'numele meu este(franceza)':
                  {
                    audioCache.play('numele meu este(franceza).mp3');
                  }
                  break;
                case 'la revedere(franceza)':
                  {
                    audioCache.play('la revedere(franceza).mp3');
                  }
                  break;
              }
            },
            child: Text(
              textList[index],
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 12.0),
            ),
          );
        },
      ),
    );
  }
}
