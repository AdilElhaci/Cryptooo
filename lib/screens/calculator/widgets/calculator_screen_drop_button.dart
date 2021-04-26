import 'package:cryptoo/core/models/crypto.model.dart';
import 'package:flutter/material.dart';

class CalculatorDropdownButton extends StatefulWidget {
  final List<CryptoModel> cryptoDataList;

  const CalculatorDropdownButton({Key key, this.cryptoDataList})
      : super(key: key);
  @override
  _CalculatorDropdownButtonState createState() =>
      _CalculatorDropdownButtonState();
}

class _CalculatorDropdownButtonState extends State<CalculatorDropdownButton> {
  String _dropDownValue, selectedValue = 'Select Cryptoo';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(color: Colors.white),
      height: 74,
      width: MediaQuery.of(context).size.width * 0.9,
      child: DropdownButton(
        hint: Text(
          selectedValue,
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
          setState(() {
            _dropDownValue = value;
            selectedValue = value.name;
          });
          print(selectedValue);
        },
        items: widget.cryptoDataList.map((valueItem) {
          return DropdownMenuItem(
            value: valueItem.name,
            child: Text(valueItem.name),
          );
        }).toList(),
      ),
    );
  }
}
