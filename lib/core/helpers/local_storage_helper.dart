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
    await LocalStorageHelper.setValue("accountId", loginResponse.id);
    await LocalStorageHelper.setValue('accountName', loginResponse.name);
    await LocalStorageHelper.setValue('accountRole', loginResponse.role);
    await LocalStorageHelper.setValue('accountCode', loginResponse.code);
    await LocalStorageHelper.setValue('accountEmail', loginResponse.email);
    await LocalStorageHelper.setValue('accountAddress', loginResponse.address);
    await LocalStorageHelper.setValue('accountPhone', loginResponse.phone);
    await LocalStorageHelper.setValue(
        'accountAvatarLink', loginResponse.avatarLink);
    await LocalStorageHelper.setValue(
        'accountLastLogin', loginResponse.lastLogin);
    await LocalStorageHelper.setValue(
        'accountLastUpdate', loginResponse.lastUpdate);
    await LocalStorageHelper.setValue('accountStatus', loginResponse.status);
  }

  static clearLoginAccount() async {
    await LocalStorageHelper.setValue("accountId", null);
    await LocalStorageHelper.setValue('accountName', null);
    await LocalStorageHelper.setValue('accountRole', null);
    await LocalStorageHelper.setValue('accountCode', null);
    await LocalStorageHelper.setValue('accountEmail', null);
    await LocalStorageHelper.setValue('accountAddress', null);
    await LocalStorageHelper.setValue('accountPhone', null);
    await LocalStorageHelper.setValue('accountAvatarLink', null);
    await LocalStorageHelper.setValue('accountLastLogin', null);
    await LocalStorageHelper.setValue('accountLastUpdate', null);
    await LocalStorageHelper.setValue('accountStatus', null);
  }
}
