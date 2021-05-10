import 'package:shared_preferences/shared_preferences.dart';

class SharedService {
  getShared() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences;
  }

  setCurrentDate(String current) async {
    SharedPreferences myShared = await getShared();
    await myShared.setString('update_date', current);
  }

  setCryptoDataUpdate(bool current) async {
    SharedPreferences myShared = await getShared();
    await myShared.setBool('hasUpdate', current);
  }

  Future<bool> getDate() async {
    SharedPreferences myShared = await getShared();
    return myShared.getBool('hasUpdate');
  }

  Future<bool> getStatus() async {
    SharedPreferences myShared = await getShared();

    return myShared.getBool('hasUpdate');
  }
}
