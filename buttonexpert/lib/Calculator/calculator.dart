import 'package:flutter/material.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String output = '0';
  String input = '';
  String op = '';
  double num1 = 0;
  double num2 = 0;
  List<String> history = [];

  void buttonPress(String value) {
    setState(() {
      if (value == 'C') {
        input = '';
        output = '0';
        op = '';
        num1 = 0;
        num2 = 0;
      } else if (value == '=') {
        num2 = double.parse(input);
        String result = '';
        if (op == '+') {
          result = (num1 + num2).toString();
          history.add('$num1 + $num2 = $result');
        } else if (op == '-') {
          result = (num1 - num2).toString();
          history.add('$num1 - $num2 = $result');
        } else if (op == '*') {
          result = (num1 * num2).toString();
          history.add('$num1 × $num2 = $result');
        } else if (op == '/') {
          if (num2 != 0) {
            result = (num1 / num2).toString();
            history.add('$num1 ÷ $num2 = $result');
          } else {
            result = 'Math Error';
            history.add('$num1 ÷ $num2 = Error');
          }
        }
        input = result;
        output = result;
      } else if (['+', '-', '*', '/'].contains(value)) {
        num1 = double.parse(input);
        op = value;
        input = '';
      } else {
        input += value;
        output = input;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.only(left: 8, top: 5),
            child: Text(
              'History',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: 100,
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...history.map((entry) => Text(entry, style:TextStyle(fontSize: 20,color: Colors.white70))).toList(),
                ],
              ),
            ),
          ),
          
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(20),
              child: Text(
                output,
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Row(
            children: [
              buildButton(onClick: () => buttonPress('7'), text: '7'),
              buildButton(onClick: () => buttonPress('8'), text: '8'),
              buildButton(onClick: () => buttonPress('9'), text: '9'),
              buildButton(
                onClick: () => buttonPress('/'),
                text: '÷',
                color: Colors.orange,
              ),
            ],
          ),
          Row(
            children: [
              buildButton(onClick: () => buttonPress('4'), text: '4'),
              buildButton(onClick: () => buttonPress('5'), text: '5'),
              buildButton(onClick: () => buttonPress('6'), text: '6'),
              buildButton(
                onClick: () => buttonPress('*'),
                text: '×',
                color: Colors.orange,
              ),
            ],
          ),
          Row(
            children: [
              buildButton(onClick: () => buttonPress('1'), text: '1'),
              buildButton(onClick: () => buttonPress('2'), text: '2'),
              buildButton(onClick: () => buttonPress('3'), text: '3'),
              buildButton(
                onClick: () => buttonPress('-'),
                text: '-',
                color: Colors.orange,
              ),
            ],
          ),
          Row(
            children: [
              buildButton(
                onClick: () => buttonPress('C'),
                text: 'C',
                color: Colors.red,
              ),
              buildButton(onClick: () => buttonPress('0'), text: '0'),
              buildButton(
                onClick: () => buttonPress('='),
                text: '=',
                color: Colors.green,
              ),
              buildButton(
                onClick: () => buttonPress('+'),
                text: '+',
                color: Colors.orange,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class buildButton extends StatelessWidget {
  final String text;
  final Color? color;
  final VoidCallback onClick;

  const buildButton({
    super.key,
    required this.onClick,
    required this.text,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: color ?? Colors.grey[800],
          ),
          onPressed: onClick,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
