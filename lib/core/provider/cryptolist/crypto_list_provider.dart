import 'package:flutter/cupertino.dart';

import '../../models/crypto.model.dart';
import '../../service/api.dart';

class CryptoManager extends ChangeNotifier {
  List<CryptoModel> cryptoItems = [];
  CryptoManager() {
    pushCrypToThisList();
  }
  Future<void> pushCrypToThisList() async {
    cryptoItems = await getCryptoData();

    notifyListeners();
  }
}
