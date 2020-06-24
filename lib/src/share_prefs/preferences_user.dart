import 'package:shared_preferences/shared_preferences.dart';
import 'package:userpreferencesapp/src/pages/home_page.dart';

class PreferencesUser {
  String pGender = 'gender';
  String pSecondaryColor = 'secondaryColor';
  String pName = 'name';
  String pLastPage = 'lastPage';

  static final PreferencesUser _instance = new PreferencesUser._internal();

  factory PreferencesUser() {
    return _instance;
  }
  PreferencesUser._internal();

  SharedPreferences _prefs;

  initPrefs() async{
    this._prefs = await SharedPreferences.getInstance();
  }

  //get/set de propiedades
  get gender {
    return this._prefs.getInt(pGender) ?? 1;
  }

  set gender(int value) {
    this._prefs.setInt(pGender, value);
  }

  get secondaryColor {
    return this._prefs.getBool(pSecondaryColor) ?? false;
  }

  set secondaryColor(bool value) {
    this._prefs.setBool(pSecondaryColor, value);
  }

  get name {
    return this._prefs.getString(pName) ?? '';
  }

  set name(String value) {
    this._prefs.setString(pName, value);
  }

  get lastPage {
    return this._prefs.getString(pLastPage) ?? HomePage.routeName;
  }

  set lastPage(String value) {
    this._prefs.setString(pLastPage, value);
  }

}