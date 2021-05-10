import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/theme.dart';
import '../../core/provider/cryptolist/crypto_list_provider.dart';
import '../../core/provider/cryptolist/cypto_textfield_provider.dart';
import '../../core/provider/cryptolist/dropdown_value_provider.dart';
import '../splash/widgets/splash_screen_title.dart';
import 'widgets/calculator_screen_drop_button.dart';
import 'widgets/calculator_screen_go_back_icon.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  double usdValue = 0;
  double tryValue = 0;
  @override
  Widget build(BuildContext context) {
    final cryptoManager = Provider.of<CryptoManager>(context);
    DropdownValueProvider selectedCryptoModel = Provider.of<DropdownValueProvider>(context);
    return Scaffold(
      backgroundColor: ProjectThemes.MAINCOLOR,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  goToHomeScreenIcon(context),
                  SizedBox(
                    width: 20,
                  ),
                  pageTitle(36),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              CalculatorDropdownButton(
                cryptoDataList: cryptoManager.cryptoItems,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              buildPaddingCryptooTextField(context, '0', selectedCryptoModel.selectedCryptoModel.symbol ?? 'BTC', false),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              buildPaddingCryptooTextField(context, usdValue.toStringAsFixed(2), 'USD', true),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              buildPaddingCryptooTextField(context, tryValue.toStringAsFixed(2), 'TRY', true),
            ],
          ),
        ),
      ),
    );
  }

  buildPaddingCryptooTextField(BuildContext context, String hitText, String suffixText, bool justDisplay) {
    CryptoTextfieldsProvider textProvider = Provider.of<CryptoTextfieldsProvider>(context);
    DropdownValueProvider selectedCryptoModel = Provider.of<DropdownValueProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 74,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: TextField(
                readOnly: justDisplay == true ? true : false,
                onChanged: (value) {
                  if (justDisplay == false) {
                    textProvider.setTextValue(double.parse(value.toString()));
                    textProvider.setUSDValue(selectedCryptoModel.selectedCryptoModel.priceUsd);
                    textProvider.setTRYValue(selectedCryptoModel.selectedCryptoModel.priceUsd);
                    setState(() {
                      if (value.isEmpty) {
                        textProvider.setTextValue(0);
                        textProvider.setUSDValue(0);
                        textProvider.setTRYValue(0);
                      }
                      usdValue = textProvider.useValue;
                      tryValue = textProvider.tryValue;
                    });
                  }
                },
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                  hintStyle: TextStyle(
                    fontSize: 30,
                  ),
                  border: InputBorder.none,
                  hintText: hitText,
                )),
          ),
          Expanded(child: Text(suffixText, style: TextStyle(fontSize: 30)))
        ],
      ),
    );
  }
}
