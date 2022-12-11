import 'package:hive_flutter/hive_flutter.dart';

import '../preferences_constants.dart';

const String hiveData = "hiveData";

class HiveDioHelper {
  static init() async {
    await Hive.initFlutter();

    await openboxData();
  }

  static Future<Box> openboxData() async {
    return await Hive.openBox(hiveData);
  }

  Future<void> closeBoxs() async {
    return await Hive.close();
  }

  getData(String key) {
    final prayerBox = Hive.box(hiveData);
    return prayerBox.get(key);
  }

  removeData(String key) {
    final prayerBox = Hive.box(hiveData);
    return prayerBox.delete(key);
  }

  Future<void> putData(String key, dynamic value) async {
    final prayerBox = Hive.box(hiveData);
    return prayerBox.put(key, value);
  }

  Future getToken() async {
    var authBox = await Hive.openBox(hiveData);
    return authBox.get(Constants.token);
  }
}
