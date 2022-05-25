import 'package:fcalculator/components/button/button.dart';
import 'package:fcalculator/components/button_row/button_row.dart';
import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  final void Function(String) cb;

  Keyboard({
    required this.cb,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(48, 48, 48, 1),
      height: MediaQuery.of(context).size.height / 1.4,
      child: Column(
        children: [
          ButtonRow(buttons: [
            Button.big(text: 'AC', color: Button.DARK, cb: cb),
            Button(text: '%', color: Button.DARK, cb: cb),
            Button.operation(text: '/', cb: cb),
          ]),
          const SizedBox(height: 2),
          ButtonRow(buttons: [
            Button(text: '7', cb: cb),
            Button(text: '8', cb: cb),
            Button(text: '9', cb: cb),
            Button.operation(text: 'X', cb: cb),
          ]),
          const SizedBox(height: 2),
          ButtonRow(buttons: [
            Button(text: '4', cb: cb),
            Button(text: '5', cb: cb),
            Button(text: '6', cb: cb),
            Button.operation(text: '-', cb: cb),
          ]),
          const SizedBox(height: 2),
          ButtonRow(buttons: [
            Button(text: '1', cb: cb),
            Button(text: '2', cb: cb),
            Button(text: '3', cb: cb),
            Button.operation(text: '+', cb: cb),
          ]),
          const SizedBox(height: 2),
          ButtonRow(buttons: [
            Button.big(text: '0', cb: cb),
            Button(text: '.', cb: cb),
            Button.operation(text: '=', cb: cb),
          ]),
        ],
      ),
    );
  }
}
