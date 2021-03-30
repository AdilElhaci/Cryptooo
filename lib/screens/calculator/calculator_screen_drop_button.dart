import 'package:flutter/material.dart';

class CalculatorDropdownButton extends StatefulWidget {
  @override
  _CalculatorDropdownButtonState createState() =>
      _CalculatorDropdownButtonState();
}

class _CalculatorDropdownButtonState extends State<CalculatorDropdownButton> {
  @override
  Widget build(BuildContext context) {
    List itemList = ['A', 'B', 'D'];
    String _dropDownValue;

    return DropdownButton(
      hint: Text('Select Cryptoo'),
      dropdownColor: Colors.white,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 36,
      isExpanded: true,
      value: _dropDownValue,
      onChanged: (value) {
        _dropDownValue = value;
      },
      items: itemList.map((valueItem) {
        return DropdownMenuItem(
          value: valueItem,
          child: Text(valueItem),
        );
      }).toList(),
    );
  }
}
