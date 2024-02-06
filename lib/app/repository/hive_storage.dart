import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

class HiveStorage {
  static clearData({required String key}) async {
    Box store = await Hive.openBox(key);
    await store.clear();
  }

  static saveData({
    required Map value,
    required String key,
  }) async {
    storeData(data: value, key: key);
  }

  static getData(String key) async {
    Box store = await Hive.openBox(key);
    List values = store.values.toList();
    values = List.from(values.map((e) => jsonDecode(e)).toList());
    return values.reversed.toList();
  }

  static getLength({required String key}) async {
    Box store = await Hive.openBox(key);
    int length = store.values.toList().length;
    return length;
  }

//
  static Future storeData({required Map data, required String key}) async {
    Box store = await Hive.openBox(key);
    String id = "";
    data.removeWhere((key, value) => value == null);
    if (data['id'] == null) {
      int length = await getLength(key: key);
      id = (length + 1).toString();
      data['id'] = id;
    }
    await store.put(data['id']?.toString() ?? id, jsonEncode(data));
  }
}
