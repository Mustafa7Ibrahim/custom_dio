import 'package:dio/dio.dart';

import '../hive_helper/hive_helper.dart';
import '../preferences_constants.dart';

/// APP Interceptor
/// This Interceptor handle error and response request for each dio request
class AppInterceptors extends InterceptorsWrapper {
  // Header field name
  static const acceptLangHeader = "Accept-Language";
  static const acceptHeader = 'accept';
  static const contentEncodingHeader = 'content-encoding';
  static const contentLengthHeader = 'content-length';
  static const contentTypeHeader = 'content-type';
  static const authenticateHeader = 'Authorization';
  static const applicationJson = "application/json";
  static const bearer = "Bearer ";

  AppInterceptors(this.hiveHelper);

  final HiveDioHelper hiveHelper;

  @override
  Future onRequest(RequestOptions options, handler) async {
    final token = await hiveHelper.getData(Constants.token);
    final baseApi = await hiveHelper.getData(Constants.baseUrl);
    options.baseUrl = baseApi;

    /// Create Time out for sending
    options.sendTimeout = (1000 * 1000);

    /// Create Time out for Connect
    options.connectTimeout = (1000 * 1000);

    /// Redirects true
    options.followRedirects = true;

    /// Add Header Accepted
    options.headers.addAll({
      Headers.acceptHeader: applicationJson,
      Headers.contentTypeHeader: applicationJson,
      acceptLangHeader: "en",
    });

    if (token != null) {
      options.headers.addAll({authenticateHeader: bearer + token});
    }

    return super.onRequest(options, handler);
  }

  @override
  Future<void> onError(DioError err, handler) async {
    return super.onError(err, handler);
  }
}
