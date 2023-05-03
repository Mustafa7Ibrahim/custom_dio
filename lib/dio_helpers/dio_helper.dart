import 'package:dio/dio.dart';

import '../get_it.dart';
import 'app_interceptor.dart';

/// Handle Http Request
class DioHelper {
  static Dio instanceDio() {
    Dio dio = gi();
    dio.interceptors.add(AppInterceptors(gi()));

    return dio;
  }

  /// Uploads a file to the server at the given [path] with the given [data].
  /// Returns a [Future] that resolves to a [Response].
  ///
  /// The [onReceiveProgress] callback will be called whenever new data is
  /// received, and will contain the number of bytes received, as well as the
  /// total number of bytes expected to be received.
  ///
  /// If the [data] is a [Map], it will be converted to a [FormData] object.
  /// Otherwise, it will be sent as is.
  ///
  /// The [queryParameters] will be appended to the [path] as query parameters.
  ///
  /// The [headers] will be used for the request.
  ///
  /// The [options] will be used for the request.
  ///
  /// The [formData] will be converted to a [FormData] object and used for the
  /// request.
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

  /// This function is used to update the data of [id] in the [path] API.
  /// It takes in the [data] to be updated, the [queryParameters] and the [headers] to be sent to the API.
  /// It also takes in the [options] and the [onReceiveProgress] for the API call.
  /// It returns a [Response] object.
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

  /// Returns a [Future<Response>] that completes with the response of the PATCH request.
  ///
  /// The [path] parameter is a string representing the endpoint of the request.
  /// The [data] parameter is the data to be sent in the body of the request. This
  /// parameter can be one of the following types:
  ///
  /// - [String]
  /// - [Map<String, dynamic>]
  /// - [List<dynamic>]
  /// - [FormData]
  ///
  /// The [queryParameters] parameter is a [Map] of parameters that will be added to
  /// the request's URL as query parameters. The keys and values of the map will
  /// be URL encoded.
  ///
  /// The [headers] parameter is a [Map] of headers that will be added to the
  /// request's headers. If a header with the same key is already present in the
  /// request's headers, the value will be overwritten.
  ///
  /// The [options] parameter is an [Options] instance that contains options for
  /// the request. This parameter overrides the default options set by the
  /// [instanceDio] method.
  ///
  /// The [onReceiveProgress] parameter is a function that will be called when
  /// data is received.
  ///
  /// See also:
  ///
  ///  * [Dio.patch], the method that this method uses to send the request.
  ///  * [instanceDio], the method that this method uses to retrieve the Dio
  ///    instance.

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

  /// Get request with Dio
  ///
  /// [path] url to request
  ///
  /// [queryParameters] query parameters
  ///
  /// [token] token to use
  ///
  /// [headers] headers to use
  ///
  /// [options] options to use
  ///
  /// [onReceiveProgress] function to call when progress is received
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

  /// This method is used to make a DELETE request to the API.
  ///
  /// It returns a Future<Response> object, which is the response of the API.
  ///
  /// It takes a String [path] parameter, which is the path of the request, and
  /// an optional [queryParameters] parameter, which is used to add query
  /// parameters to the request.
  ///
  /// It also takes an optional [token] parameter, which is used to add the
  /// token to the request headers. It also takes an optional [headers] parameter,
  /// which is used to add custom headers to the request. It also takes an
  /// optional [options] parameter, which is used to add custom options to the
  /// request.
  ///
  /// It uses the [instanceDio()] method to get the Dio instance, and uses the
  /// Dio [delete()] method to make the DELETE request.
  ///
  /// It has an optional [options] parameter, which is used to add custom
  /// options to the request.
  ///
  /// It returns a Future<Response> object, which is the response of the API.
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
