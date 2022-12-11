library custom_dio;

import 'package:custom_dio/hive_helper/hive_helper.dart';

/// A Calculator.
class CustomDio {
  CustomDio(baseUrl) {
    HiveDioHelper().putData('baseURL', baseUrl);
  }
}
