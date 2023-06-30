import 'package:flutter/material.dart';
import 'package:webgetpost/apis.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: ScreenHome(),
    );
  }
}

class ScreenHome extends StatefulWidget {
  ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final _numberInputController = TextEditingController();

  String _resultText = 'Type a number and press the button';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a number',
                ),
                controller: _numberInputController,
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (_numberInputController.text.isEmpty) {
                      return;
                    }
                    if (int.tryParse(_numberInputController.text) == null) {
                      return;
                    }
                    final _number = int.parse(_numberInputController.text);
                    //print(_number);
                    final _result = await getNumberFact(num: _number);
                    // print(_result.text);
                    setState(() {
                      _resultText = _result.text ?? 'No text';
                    });
                  },
                  child: const Text('Press me')),
              Text(_resultText),
            ],
          ),
        ),
      ),
    );
  }
}
