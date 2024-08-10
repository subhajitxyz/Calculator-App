import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorHome(),
    );
  }
}

class CalculatorHome extends StatefulWidget {
  @override
  _CalculatorHomeState createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  String _output = "0";
  String _result = "0";
  String _operand = "";
  String _num1Str ="";
  String _num2Str = "";
  double _num1 = 0.0;
  double _num2 = 0.0;

  void buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      _output = "0";
      _num1 = 0.0;
      _num2 = 0.0;
      _num1Str= "0";
      _num2Str = "0";
      _result = "0";
      _operand = "";
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "X") {
      //_num1 = double.parse(_output);
      _operand = buttonText;
      _output += buttonText;

    } else if (buttonText == ".") {
      if (!_result.contains(".")) {
        _result += buttonText;
      }
      _output += buttonText;
    } else if (buttonText == "=") {
      //_num2 = double.parse(_result);

      _num1= double.parse(_num1Str);
      _num2 = double.parse(_num2Str);

      switch (_operand) {
        case "+":
          _result = (_num1 + _num2).toString();
          break;
        case "-":
          _result = (_num1 - _num2).toString();
          break;
        case "X":
          _result = (_num1 * _num2).toString();
          break;
        case "/":
          _result = (_num1 / _num2).toString();
          break;
      }

      _output = _result;
      _num1 = 0;
      _num2 = 0.0;
      _num1Str = _result;
      _num2Str = "";
      _operand = "";
    } else {
      //press any number
      //if operand present -> we take input in num2
      // else -> we take input in num1

      if(_operand==""){
        _num1Str+= buttonText;
      }else {
        _num2Str += buttonText;
      }
      _output+= buttonText;

    }

    setState(() {
      _output = _output;
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () => buttonPressed(buttonText),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange, // Set the background color to orange
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Simple Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(
              vertical: 18.0,
              horizontal: 12.0,
            ),
            child: Text(
              _output,
              style: const TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Expanded(
            child: Divider(),
          ),
          Column(children: [
            Row(children: [
              buildButton("7"),
              buildButton("8"),
              buildButton("9"),
              buildButton("/"),
            ]),
            Row(children: [
              buildButton("4"),
              buildButton("5"),
              buildButton("6"),
              buildButton("X"),
            ]),
            Row(children: [
              buildButton("1"),
              buildButton("2"),
              buildButton("3"),
              buildButton("-"),
            ]),
            Row(children: [
              buildButton("."),
              buildButton("0"),
              buildButton("00"),
              buildButton("+"),
            ]),
            Row(children: [
              buildButton("CLEAR"),
              buildButton("="),
            ]),
          ]),
        ],
      ),
    );
  }
}

