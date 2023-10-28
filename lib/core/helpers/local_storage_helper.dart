import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../model/login.dart';

class LocalStorageHelper {
  LocalStorageHelper._internal();
  static final LocalStorageHelper _shared = LocalStorageHelper._internal();

  factory LocalStorageHelper() {
    return _shared;
  }

  Box<dynamic>? hiveBox;

  static initLocalStorageHelper() async {
    _shared.hiveBox = await Hive.openBox('Apartee');
  }

  static dynamic getValue(String key) {
    return _shared.hiveBox?.get(key);
  }

  static setValue(String key, dynamic val) {
    _shared.hiveBox?.put(key, val);
  }
}

class LoginAccount {
  static Future<LoginResponse> loadLoginAccount() async {
    LoginResponse account = LoginResponse(
        id: await LocalStorageHelper.getValue('accountId'),
        code: await LocalStorageHelper.getValue('accountCode'),
        name: await LocalStorageHelper.getValue('accountName'),
        email: await LocalStorageHelper.getValue('accountEmail'),
        role: await LocalStorageHelper.getValue('accountRole'),
        lastLogin: await LocalStorageHelper.getValue('accountLastLogin'),
        lastUpdate: await LocalStorageHelper.getValue('accountLastUpdate'),
        status: await LocalStorageHelper.getValue('accountStatus'),
        address: await LocalStorageHelper.getValue('accountAddress'),
        avatarLink: await LocalStorageHelper.getValue('accountAvatarLink'),
        phone: await LocalStorageHelper.getValue('accountPhone'));

    return account;
  }

  static saveLoginAccount(LoginResponse loginResponse) async {
    LocalStorageHelper.setValue("accountId", loginResponse.id);
    LocalStorageHelper.setValue('accountName', loginResponse.name);
    LocalStorageHelper.setValue('accountRole', loginResponse.role);
    LocalStorageHelper.setValue('accountCode', loginResponse.code);
    LocalStorageHelper.setValue('accountEmail', loginResponse.email);
    LocalStorageHelper.setValue('accountAddress', loginResponse.address);
    LocalStorageHelper.setValue('accountPhone', loginResponse.phone);
    LocalStorageHelper.setValue('accountAvatarLink', loginResponse.avatarLink);
    LocalStorageHelper.setValue('accountLastLogin', loginResponse.lastLogin);
    LocalStorageHelper.setValue('accountLastUpdate', loginResponse.lastUpdate);
    LocalStorageHelper.setValue('accountStatus', loginResponse.status);
  }
}
