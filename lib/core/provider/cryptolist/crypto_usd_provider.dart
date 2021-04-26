import 'package:flutter/cupertino.dart';

class CryptoUsdTextfieldProvider extends ChangeNotifier {
  double usdValue;
  CryptoUsdTextfieldProvider() {
    usdValue = 0;
  }

  Future<void> setUSDValue(double number, double value) async {
    usdValue = number * value;
    notifyListeners();
  }
}
