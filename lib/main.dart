import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[800],
          title: Center(
            child: Text('Basic Calculator'),
          ),
        ),
        backgroundColor: Colors.grey[300],
        body: Calculator(),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String answer = '0', output = '0', operand = '';
  double num1 = 0.0, num2 = 0.0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              color: Colors.grey[100],
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 3),
                child: Text(
                  '$output',
                  //textDirection: TextDirection.rtl,
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 60, fontFamily: 'MetalMania'),
                ),
              ),
            ),
          ),
          Divider(
            height: 30,
            thickness: 1,
            color: Colors.black,
          ),
          SizedBox(height: 50),
          Row(
            children: <Widget>[
              button('1'),
              button('2'),
              button('3'),
              button('+'),
            ],
          ),
          Row(
            children: <Widget>[
              button('4'),
              button('5'),
              button('6'),
              button('-'),
            ],
          ),
          Row(
            children: <Widget>[
              button('7'),
              button('8'),
              button('9'),
              button('x'),
            ],
          ),
          Row(
            children: <Widget>[
              button('0', flexSize: 2),
              button('.'),
              button('/'),
            ],
          ),
          Row(
            children: <Widget>[
              button("=", flexSize: 3),
              button("C"),
            ],
          )
        ],
      ),
    );
  }

  Expanded button(String value, {int flexSize = 1}) { // button function
    return Expanded(
      flex: flexSize,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: FlatButton(
          color: Colors.white,
          onPressed: () { // Caculator Logic
            if (value == "C") {
              answer = '0';
              num1 = 0.0;
              num2 = 0.0;
              operand = '';
            } else if (value == '+' ||
                value == '-' ||
                value == '/' ||
                value == 'x') {
              num1 = double.parse(output);
              operand = value;
              answer = '0';
            } else if (value == '.') {
              if (answer.contains('.')) {
                return;
              } else {
                answer += value;
              }
            } else if (value == '=') {
              num2 = double.parse(output);

              if (operand == '+') {
                answer = (num1 + num2).toString();
              }
              if (operand == '-') {
                answer = (num1 - num2).toString();
              }
              if (operand == 'x') {
                answer = (num1 * num2).toString();
              }
              if (operand == '/') {
                answer = (num1 / num2).toString();
              }
              num1 = 0.0; // reset num1, num2 and operand.
              num2 = 0.0;
              operand = '';
            } else {
              answer += value;
            }
            setState(() {
              output = double.parse(answer).toString();
            });
          },
          child: Text(
            '$value',
            style: TextStyle(fontSize: 50, fontFamily: 'MetalMania'),
          ),
        ),
      ),
    );
  }
}
