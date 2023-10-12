import 'package:hive_flutter/adapters.dart';

class LocalStorageHelper {
  LocalStorageHelper._internal();
  static final LocalStorageHelper _helper = LocalStorageHelper._internal();

  factory LocalStorageHelper() {
    return _helper;
  }

  Box<dynamic>? hiveBox;

  static initLocalStorageHelper() async {
    _helper.hiveBox = await Hive.openBox('flutter_demo_02');
  }

  static dynamic getValue(String key) {
    return _helper.hiveBox?.get(key);
  }

  static setValue(String key, dynamic val) {
    _helper.hiveBox?.put(key, val);
  }
}
