import 'package:flutter/cupertino.dart';

import '../../models/crypto.model.dart';

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
