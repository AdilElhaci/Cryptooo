import 'package:flutter/cupertino.dart';

class CryptoTextfieldsProvider extends ChangeNotifier {
  double useValue;
  double tryValue;
  double textValue;
  CryptoTextfieldsProvider() {
    textValue = 0;
    useValue = 0;
    tryValue = 0;
  }

  Future<void> setTextValue(double number) async {
    textValue = number;
    notifyListeners();
  }

  Future<void> setUSDValue(double value) async {
    useValue = this.textValue * value;
    notifyListeners();
  }

  Future<void> setTRYValue(double value) async {
    tryValue = this.textValue * value;
    notifyListeners();
  }
}
