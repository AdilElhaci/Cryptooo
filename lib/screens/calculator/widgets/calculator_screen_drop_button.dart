import 'package:flutter/material.dart';

class CalculatorDropdownButton extends StatefulWidget {
  @override
  _CalculatorDropdownButtonState createState() =>
      _CalculatorDropdownButtonState();
}

class _CalculatorDropdownButtonState extends State<CalculatorDropdownButton> {
  @override
  Widget build(BuildContext context) {
    List itemList = ['ADA', 'Ethereum', 'NEO'];
    String _dropDownValue;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(color: Colors.white),
      height: 74,
      width: MediaQuery.of(context).size.width * 0.9,
      child: DropdownButton(
        hint: Text(
          'Select Cryptoo',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24),
        ),
        dropdownColor: Colors.white,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 36,
        underline: SizedBox(),
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
      ),
    );
  }
}
