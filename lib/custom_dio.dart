library custom_dio;

import 'package:custom_dio/hive_helper/hive_helper.dart';
import 'package:custom_dio/preferences_constants.dart';

class CustomDio {
  CustomDio(baseUrl) {
    // Save the base URL to Hive
    HiveDioHelper().putData(Constants.baseUrl, baseUrl);
  }
}
