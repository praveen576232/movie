import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataBase {
  Future<bool> saveJsonObject(String key, Map<String, dynamic> value);
  Map<String, dynamic> getJsonObject(String key);
}

class LocalDataBaseImp extends LocalDataBase {
  final SharedPreferences _sharedPreferences;
  LocalDataBaseImp(this._sharedPreferences);

  @override
  Map<String, dynamic> getJsonObject(String key) {
    return jsonDecode(_sharedPreferences.getString(key) ?? "{}");
  }

  @override
  Future<bool> saveJsonObject(String key, Map<String, dynamic> value) {
    return _sharedPreferences.setString(key, jsonEncode(value));
  }
}
