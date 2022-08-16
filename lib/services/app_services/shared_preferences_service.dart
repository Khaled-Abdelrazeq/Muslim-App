import 'dart:developer';

import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService extends GetxService {
  SharedPreferences? _preferences;

  Future<SharedPreferences> _getInstance() async {
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
      return _preferences!;
    } else {
      return _preferences!;
    }
  }

  Future<bool> saveValueWithKey<T>(String key, T value,
      {bool hideDebugPrint = false}) async {
    await _getInstance();
    _preferencesAssertion();
    if (hideDebugPrint) {
      log("SharedPreferences: [Saving data] -> key: $key, value: $value");
    }
    if (value is String) {
      return await _preferences?.setString(key, value) ?? false;
    } else if (value is bool) {
      return await _preferences?.setBool(key, value) ?? false;
    } else if (value is double) {
      return await _preferences?.setDouble(key, value) ?? false;
    } else if (value is int) {
      return await _preferences?.setInt(key, value) ?? false;
    }
    throw Exception();
  }

  Future<E?> getValueWithKey<E>(String key,
      {bool hideDebugPrint = false}) async {

    _preferencesAssertion();
    var value = _preferences?.get(key);
    if (hideDebugPrint) {
      log("SharedPreferences: [Reading data] -> key: $key, value: $value");
    }
    return value as E?;
  }

  Future<Set<String>?> getKeys()async{
    await _getInstance();
    return _preferences?.getKeys();
  }

  Future<bool> removeValueWithKey(String key) async {
    await _getInstance();
    _preferencesAssertion();
    var value = _preferences?.get(key);
    if (value == null) return true;
    log("SharedPreferences: [Removing data] -> key: $key, value: $value");
    return await _preferences?.remove(key) ?? false;
  }

  Future<void> removeMultipleValuesWithKeys(List<String> keys) async {
    await _getInstance();
    _preferencesAssertion();
    var value;
    for (String key in keys) {
      value = _preferences?.get(key);
      if (value == null) {
        log("SharedPreferences: [Removing data] -> key: $key, value: {ERROR 'null' value}");
        log("Skipping...");
      } else {
        await _preferences?.remove(key);
        log("SharedPreferences: [Removing data] -> key: $key, value: $value");
      }
    }
    return;
  }

  Future<bool> clearAll() async {
    await _getInstance();
    _preferencesAssertion();
    return await _preferences?.clear() ?? false;
  }

  Future<bool> remove(key) async {
    await _getInstance();
    return await _preferences?.remove(key) ?? false;
  }

  bool containsKey(String key) {
    return _preferences?.containsKey(key) ?? false;
  }

  Future<bool> clear() async {
    await _getInstance();
    return await _preferences?.clear() ?? false;
  }

  void _preferencesAssertion() {
    if (_preferences == null) {
      throw Exception();
    }
  }


}
