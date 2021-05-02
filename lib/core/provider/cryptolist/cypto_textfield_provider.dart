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
    print(textValue);
    notifyListeners();
  }

  Future<void> setUSDValue(double value) async {
    useValue = this.textValue * value;
    print(useValue);
    notifyListeners();
  }

  Future<void> setTRYValue(double value) async {
    tryValue = this.textValue * 8 * value;
    print(tryValue);
    notifyListeners();
  }
}
