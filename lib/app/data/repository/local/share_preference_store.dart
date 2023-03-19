import 'dart:convert';

import 'package:banking_app/app/dormain/repository/local/local_store.dart';
import 'package:banking_app/core/helpers/storage_helper.dart';

class SharedPreferenceStore extends LocalStore {
  @override
  Future<void> clearAll() async {
    StorageHelper.clear();
  }

  @override
  Future<void> delete(String key) async {
    StorageHelper.remove(key);
  }

  @override
  Future get(String key) async {
    String? value = await StorageHelper.getString(key);
    Map<String, dynamic> userMap = jsonDecode(value!);
    return userMap;
  }

  @override
  Future<void> init() async {
    //
  }

  @override
  Future<void> set<T>(String key, T value) async {
    StorageHelper.setString(key, jsonEncode(value).toString());
  }
}
