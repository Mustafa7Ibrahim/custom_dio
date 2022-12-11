library custom_dio;

import 'package:custom_dio/get_it.dart';
import 'package:custom_dio/hive_helper/hive_helper.dart';

/// A Calculator.
class CustomDio {
  CustomDio(baseUrl) {
    gi<HiveDioHelper>().putData('baseURL', baseUrl);
  }
}
