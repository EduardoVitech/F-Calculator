import 'package:fcalculator/components/display/display.dart';
import 'package:fcalculator/components/keyboard/keyboard.dart';
import 'package:fcalculator/models/memory/memory.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final Memory memory = Memory();

  _onPressed(String comand) {
    setState(() {
      memory.applyComand(comand);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Column(
        children: [
          Display(text: memory.value),
          Keyboard(cb: _onPressed),
        ],
      ),
    );
  }
}
