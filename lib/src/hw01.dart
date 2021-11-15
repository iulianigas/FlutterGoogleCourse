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
  final TextEditingController controller = TextEditingController();
  String? errorText;
  bool pressed = false;
  double? convertedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Currency convertor'),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Image.network('https://i0.1616.ro/media/2/2621/33211/20408407/2/9v8a2732.jpg'),
          Container(
            margin: const EdgeInsetsDirectional.all(16.0),
            child: TextField(
              controller: controller,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                hintText: 'Enter the amount in EUR',
                errorText: errorText,
                suffix: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    controller.clear();
                  },
                ),
              ),
            ),
          ),
          ElevatedButton(
            child: const Text('CONVERT!'),
            onPressed: () {
              final String value = controller.text;
              final double? doubleValue = double.tryParse(value);

              setState(() {
                if (doubleValue == null) {
                  errorText = 'This is not a number';
                } else {
                  errorText = null;
                  convertedValue = doubleValue * 4.95;
                  pressed = !pressed;
                }
              });
            },
          ),
          Visibility(
            visible: pressed,
            child: Text('$convertedValue'),
          )
        ],
      ),
    );
  }
}
