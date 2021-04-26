import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/models/crypto.model.dart';
import '../../../core/provider/cryptolist/dropdown_value_provider.dart';

class CalculatorDropdownButton extends StatefulWidget {
  final List<CryptoModel> cryptoDataList;

  const CalculatorDropdownButton({Key key, this.cryptoDataList})
      : super(key: key);
  @override
  _CalculatorDropdownButtonState createState() =>
      _CalculatorDropdownButtonState();
}

class _CalculatorDropdownButtonState extends State<CalculatorDropdownButton> {
  CryptoModel _dropDownValue;
  DropdownValueProvider selectedCryptoModel;
  @override
  void initState() {
    super.initState();

    _dropDownValue = widget.cryptoDataList.first;
    selectedCryptoModel?.setCryptoModel(_dropDownValue);
  }

  String selectedValue = 'Select Cryptoo';
  @override
  Widget build(BuildContext context) {
    selectedCryptoModel = Provider.of<DropdownValueProvider>(context);
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
            print(value);
            _dropDownValue = value;
            selectedValue = value.name;
          });
          selectedCryptoModel.setCryptoModel(value);
        },
        items: widget.cryptoDataList.map((valueItem) {
          return DropdownMenuItem(
            value: valueItem,
            child: Text(valueItem.name),
          );
        }).toList(),
      ),
    );
  }
}
