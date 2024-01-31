import 'package:flutter/material.dart';
import 'package:app2/MyObject.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final MyObject _myObject = MyObject(value: 0);
  int n = 0;

  void _calculate(Operation operation) {
    setState(() {
      switch (operation) {
        case Operation.Add:
          _myObject.setvalue = _myObject.getvalue + n;
          break;
        case Operation.Subtract:
          _myObject.setvalue = _myObject.getvalue - n;
          break;
        case Operation.Multiply:
          _myObject.setvalue = _myObject.getvalue * n;
          break;
        case Operation.Divide:
          if (n != 0) {
            _myObject.setvalue = _myObject.getvalue ~/ n;
          } else {
            debugPrint('Cannot divide by zero.');
          }
          break;
        case Operation.Square:
          _myObject.square();
          break;
        case Operation.Power:
          _myObject.setvalue = _myObject.power(n);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'nhập vào một số n',
              ),
              onChanged: (value) {
                n = int.parse(value);
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton.icon(
                  onPressed: () {
                    _calculate(Operation.Add);
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('cộng'),
                ),
                OutlinedButton.icon(
                  onPressed: () {
                    _calculate(Operation.Subtract);
                  },
                  icon: const Icon(Icons.remove),
                  label: const Text('trừ'),
                ),
                OutlinedButton.icon(
                  onPressed: () {
                    _calculate(Operation.Multiply);
                  },
                  icon: const Icon(Icons.percent),
                  label: const Text('nhân'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton.icon(
                  onPressed: () {
                    _calculate(Operation.Divide);
                  },
                  icon: const Icon(Icons.safety_divider),
                  label: const Text('chia'),
                ),
                OutlinedButton.icon(
                  onPressed: () {
                    _calculate(Operation.Square);
                  },
                  icon: const Icon(Icons.square),
                  label: const Text('bình phương'),
                ),
                OutlinedButton.icon(
                  onPressed: () {
                    _calculate(Operation.Power);
                  },
                  icon: const Icon(Icons.power),
                  label: const Text('lũy thừa'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'kết quả : ${_myObject.getvalue}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum Operation {
  Add,
  Subtract,
  Multiply,
  Divide,
  Square,
  Power,
}
