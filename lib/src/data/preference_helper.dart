
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper{
  SharedPreferences prefs;
  static final String PASSWORD_REMEMBER = "REMEMBER";
  static final String PASSWORD_KEY = "KEY";
  static final String HISTORIC = "HISTORIC";

  Future<SharedPreferences> getInstance() async {
    if(prefs == null)
      prefs = await SharedPreferences.getInstance();
    return prefs;


  }

  // -------------- password -------------
  // --- enable ----
  Future<void> setPasswordRemember(String address, bool enable) async {
    await prefs.setBool(PASSWORD_REMEMBER + address, enable);
  }

  bool getPasswordRemember(String address)  {
    return (prefs.getBool(PASSWORD_REMEMBER + address) ?? false);
  }

  // --- key ----
  Future<void> setPasswordKey(String address, String password) async {
    await prefs.setString(PASSWORD_KEY + address, password);
  }

  String getPasswordKey(String address) {
    return prefs.getString(PASSWORD_KEY + address);
  }

  Future<void> removerPasswordKey(String address) async {
     prefs.remove(PASSWORD_KEY + address);
  }


  // -------------- Historic -------------
  Future<void> setHistoric(List<String> historic) async {
    await prefs.setStringList(HISTORIC, historic);
  }

  List<String> getHistoric() {
    return prefs.getStringList(HISTORIC);
  }

}