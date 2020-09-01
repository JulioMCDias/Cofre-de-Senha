
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper{
  SharedPreferences _prefs;
  static final String PASSWORD_REMEMBER = "REMEMBER";
  static final String PASSWORD_KEY = "KEY";
  static final String HISTORIC = "HISTORIC";

  Future<SharedPreferences> get prefs async{
    if(_prefs == null)
    _prefs = await SharedPreferences.getInstance() ;
    return _prefs;
  }

    // -------------- password -------------
    // --- enable ----
    Future<void> setPasswordRemember(String address, bool enable) async {
      (await prefs).setBool(PASSWORD_REMEMBER + address, enable);
    }

    Future<bool> getPasswordRemember(String address) async {
      return ((await prefs).getBool(PASSWORD_REMEMBER + address) ?? false);
    }

    // --- key ----
    Future<void> setPasswordKey(String address, String password) async {
      await (await prefs).setString(PASSWORD_KEY + address, password);
    }

    Future<String> getPasswordKey(String address) async {
      return (await prefs).getString(PASSWORD_KEY + address);
    }

    Future<void> removerPasswordKey(String address) async {
      (await prefs).remove(PASSWORD_KEY + address);
    }


    // -------------- Historic -------------
    Future<void> setHistoric(List<String> historic) async {
      (await prefs).setStringList(HISTORIC, historic);
    }

    Future<List<String>> getHistoric() async {
      return (await prefs).getStringList(HISTORIC);
    }
}