library custom_dio;

import 'package:custom_dio/hive_helper/hive_helper.dart';
import 'package:custom_dio/preferences_constants.dart';

/// A Calculator.
class CustomDio {
  CustomDio(baseUrl) {
    HiveDioHelper().putData(Constants.baseUrl, baseUrl);
  }
}
