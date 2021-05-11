import 'package:cryptoo/core/database-helper.dart';
import 'package:cryptoo/core/models/crypto.model.dart';
import 'package:cryptoo/core/models/weekly-crpyto.model.dart';
import 'package:cryptoo/core/service/api.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedService {
  List<CryptoModel> cryptoItems = [];
  getShared() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences;
  }

  setCurrentDate(String current) async {
    SharedPreferences myShared = await getShared();
    await myShared.setString('update_date', current);
  }

  Future<String> getDate() async {
    SharedPreferences myShared = await getShared();
    return myShared.getString('update_date');
  }

  Future<void> getDataStatus() async {
    String storedDate = await getDate();
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String currentDate = formatter.format(now);
    int _id = 436;
    if (!storedDate.contains(currentDate)) {
      print('!!');
      cryptoItems = await getCryptoData();

      print('/////////////////');
      for (var item in cryptoItems) {
        WeeklyCryptoModel model = WeeklyCryptoModel(symbol: item.symbol, price: item.priceUsd, date: currentDate);
        await DatabaseHelper.instance.addCrypto(model);
      }

      // setCurrentDate(currentDate);
    }
  }

  setDataStatus(bool current) async {
    SharedPreferences myShared = await getShared();
    await myShared.setBool('hasUpdate', current);
  }
}
