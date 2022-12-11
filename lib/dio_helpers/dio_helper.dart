import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../get_it.dart';
import 'app_interceptor.dart';

/// Handle Http Request
class DioHelper {
  static Dio instanceDio() {
    Dio dio = gi();
    dio.interceptors.add(AppInterceptors(gi()));

    if (!kIsWeb) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
    }
    return dio;
  }

  Future<Response> post(
    String path, {
    data,
    queryParameters,
    headers,
    formData,
    Options? options,
    Function(int, int)? onReceiveProgress,
  }) async {
    return instanceDio().post(
      path,
      onReceiveProgress: onReceiveProgress,
      data: data ?? FormData.fromMap(formData),
      queryParameters: queryParameters,
      options: options ?? Options(headers: headers),
    );
  }

  Future<Response> put(
    String path, {
    data,
    queryParameters,
    headers,
    Options? options,
    Function(int, int)? onReceiveProgress,
  }) async {
    return instanceDio().put(
      path,
      data: data,
      onReceiveProgress: onReceiveProgress,
      queryParameters: queryParameters,
      options: options ?? Options(headers: headers),
    );
  }

  Future<Response> patch(
    String path, {
    data,
    queryParameters,
    headers,
    Options? options,
    Function(int, int)? onReceiveProgress,
  }) async {
    return instanceDio().patch(
      path,
      data: data,
      onReceiveProgress: onReceiveProgress,
      queryParameters: queryParameters,
      options: options ?? Options(headers: headers),
    );
  }

  Future<Response> get(
    String path, {
    dynamic queryParameters,
    token,
    headers,
    Options? options,
    Function(int, int)? onReceiveProgress,
  }) async {
    return instanceDio().get(
      path,
      onReceiveProgress: onReceiveProgress,
      queryParameters: queryParameters,
      options: options ?? Options(headers: headers),
    );
  }

  Future<Response> delete(
    String path, {
    queryParameters,
    token,
    headers,
    Options? options,
  }) {
    return instanceDio().delete(
      path,
      queryParameters: queryParameters,
      options: options ?? Options(headers: headers),
    );
  }
}
