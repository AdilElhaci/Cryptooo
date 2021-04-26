import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/theme.dart';
import '../../core/provider/cryptolist/crypto_list_provider.dart';
import '../../core/provider/cryptolist/dropdown_value_provider.dart';
import '../splash/widgets/splash_screen_title.dart';
import 'widgets/calculator_screen_drop_button.dart';
import 'widgets/calculator_screen_go_back_icon.dart';
import 'widgets/calculator_screen_textfield.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    final cryptoManager = Provider.of<CryptoManager>(context);
    DropdownValueProvider selectedCryptoModel =
        Provider.of<DropdownValueProvider>(context);
    return Scaffold(
      backgroundColor: ProjectThemes.MAINCOLOR,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Stack(
            children: [
              Positioned(
                  left: 10,
                  child: Container(
                    width: 60,
                    height: 60,
                    child: goToHomeScreenIcon(context),
                  )),
              Positioned(
                left: 83,
                child: pageTitle(36),
              ),
              Positioned(
                top: 100,
                left: 25,
                child: CalculatorDropdownButton(
                  cryptoDataList: cryptoManager.cryptoItems,
                ),
              ),
              Positioned(
                  top: 239,
                  left: 25,
                  child: buildPaddingCryptooTextField(
                      context,
                      '0',
                      selectedCryptoModel.selectedCryptoModel.symbol ?? 'BTC',
                      false)),
              Positioned(
                  top: 338,
                  left: 25,
                  child:
                      buildPaddingCryptooTextField(context, '0', 'USD', true)),
              Positioned(
                  top: 440,
                  left: 25,
                  child:
                      buildPaddingCryptooTextField(context, '0', 'TRY', true)),
            ],
          ),
        ),
      ),
    );
  }
}
