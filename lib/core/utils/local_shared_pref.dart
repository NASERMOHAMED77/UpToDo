import 'package:shared_preferences/shared_preferences.dart';

class CacheLocal {
  static late SharedPreferences sharedPreferences;
  static Future sharedPrefInt() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> insertDataIntoCache(
      {required String key, required String value}) async {
    return await sharedPreferences.setString(key, value);
  }

 static String getDataFromCache({required String key}) {
    return sharedPreferences.getString(key) ?? "";
  }

  Future<bool> removeDataFromCache({required String key}) async{
  return await  sharedPreferences.remove(key);
  }
}
