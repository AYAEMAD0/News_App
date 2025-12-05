import 'package:shared_preferences/shared_preferences.dart';

class SharedCheckHelper{
  static SharedPreferences? prefs;
  static const String themeKey = 'isThemeDark';

  static Future init()async{
    prefs=await SharedPreferences.getInstance();
  }
  static Future<bool> getTheme()async{
    return prefs?.getBool(themeKey) ?? false;
  }
  static Future<void> setTheme(value)async{
    await prefs?.setBool(themeKey,value) ;
  }

}