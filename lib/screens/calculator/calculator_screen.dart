import 'package:cryptoo/core/constants/theme.dart';
import 'package:cryptoo/core/manager/cryptolist/crypto_list_manager.dart';
import 'package:cryptoo/core/models/crypto.model.dart';
import 'package:cryptoo/screens/calculator/widgets/calculator_screen_drop_button.dart';
import 'package:cryptoo/screens/calculator/widgets/calculator_screen_go_back_icon.dart';
import 'package:cryptoo/screens/calculator/widgets/calculator_screen_textfield.dart';
import 'package:cryptoo/screens/splash/widgets/splash_screen_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    List<CryptoModel> cryptoDataList = [];
    final cryptoManager = Provider.of<CryptoManager>(context);
    cryptoDataList = cryptoManager.cryptoItems;
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
                  cryptoDataList: cryptoDataList,
                ),
              ),
              Positioned(
                  top: 239,
                  left: 25,
                  child: buildPaddingCryptooTextField(context, '0', 'ADA')),
              Positioned(
                  top: 338,
                  left: 25,
                  child: buildPaddingCryptooTextField(context, '0', 'USD')),
              Positioned(
                  top: 440,
                  left: 25,
                  child: buildPaddingCryptooTextField(context, '0', 'TRY')),
            ],
          ),
        ),
      ),
    );
  }
}
