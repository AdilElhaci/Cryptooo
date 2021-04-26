import '../../models/crypto.model.dart';
import 'package:flutter/cupertino.dart';

class DropdownValueProvider extends ChangeNotifier {
  CryptoModel selectedCryptoModel;
  DropdownValueProvider() {
    selectedCryptoModel = CryptoModel();
  }
  Future<void> setCryptoModel(CryptoModel cryptoModel) async {
    selectedCryptoModel = cryptoModel;
    notifyListeners();
  }
}
