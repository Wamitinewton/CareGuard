/*
  * http operation class
  *
  * Manual
  * https://github.com/flutterchina/dio/blob/master/README-ZH.md
  *
  * 
  * Upgrade from 3 to 4
  * https://github.com/flutterchina/dio/blob/master/migration_to_4.x.md
*/

import 'package:careguard/values/server.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';

class HttpUtil {
  static final HttpUtil _httpUtil = HttpUtil._internal();
  factory HttpUtil() => _httpUtil;
  // factory constructor ensures that only one instance of HttpUtil will be created

  late Dio dio;
  CancelToken cancelToken = CancelToken();
  HttpUtil._internal() {
    // BaseOptions、Options、RequestOptions Parameters can be configured, the priorities increase in order, and parameters can be overridden according to the priority.
    BaseOptions options = BaseOptions(
      baseUrl: SERVER_API_URL,
      // baseUrl: storage.read(key: STORAGE_KEY_APIURL) ?? SERVICE_API_BASEURL,
      //Connection server timeout, unit is milliseconds.

      connectTimeout: const Duration(milliseconds: 20000),

      // The interval between two received data on the response stream, in milliseconds。
      receiveTimeout: const Duration(milliseconds: 20000),

      headers: {},

      /// Content-Type of the request, the default value is "application/json; charset=utf-8".
      /// If you want to encode request data in "application/x-www-form-urlencoded" format,
      /// You can set this option to `Headers.formUrlEncodedContentType`, so [Dio]
      /// The request body will be automatically encoded.

      contentType: 'application/json; charset=utf-8',

      /// [responseType] indicates the format (method) in which response data is expected to be received.
      /// Currently [ResponseType] accepts three types: `JSON`, `STREAM`, `PLAIN`.
      ///
      /// The default value is `JSON`. When the content-type in the response header is "application/json", dio will automatically convert the response content into a json object.
      /// If you want to receive the response data in binary form, such as downloading a binary file, you can use `STREAM`.
      ///
      /// If you want to receive response data in text (string) format, use `PLAIN`.

      responseType: ResponseType.json,
    );

    dio = Dio(options);

    CookieJar cookieJar = CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));
    // interceptors allow for custom logic to be executed before a request has been sent

    //Add interceptor

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // do something before request is sent

        return handler.next(options);

        // If you want to complete the request and return some custom data, you can resolve a Response object `handler.resolve(response)`.
        // In this way, the request will be terminated, the upper-level then will be called, and the data returned in then will be your custom response.
        //
        // If you want to terminate the request and trigger an error, you can return a `DioError` object, such as `handler.reject(error)`,
        // In this way, the request will be aborted and an exception will be triggered, and the upper layer catchError will be called.
      },
      onResponse: (response, handler) {
        // Do something with Response data

        return handler.next(response);

        // If you want to terminate the request and trigger an error, you can reject a `DioError` object, such as `handler.reject(error)`,
        // In this way, the request will be aborted and an exception will be triggered, and the upper layer catchError will be called.
      },
      onError: (DioException e, handler) {
        // Do something with response error
        // Loading.dismiss();
      },
    ));
  }

  ErrorEntity createErrorEntity(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        return ErrorEntity(code: -1, message: "Request cancellation");
      case DioExceptionType.connectionTimeout:
        return ErrorEntity(code: -1, message: "Connection timed out");
      case DioExceptionType.sendTimeout:
        return ErrorEntity(code: -1, message: "Request timed out");
      case DioExceptionType.receiveTimeout:
        return ErrorEntity(code: -1, message: "Response timeout");
      case DioExceptionType.badCertificate:
        return ErrorEntity(code: -1, message: "Bad Certificate");
      case DioExceptionType.badResponse:
        {
          try {
            int errCode =
                error.response != null ? error.response!.statusCode! : -1;

            switch (errCode) {
              case 400:
                return ErrorEntity(
                    code: errCode, message: "Request syntax error");
              case 401:
                return ErrorEntity(code: errCode, message: "permission denied");
              case 403:
                return ErrorEntity(
                    code: errCode, message: "Server refuses to execute");
              case 404:
                return ErrorEntity(
                    code: errCode, message: "can not reach server");
              case 405:
                return ErrorEntity(
                    code: errCode, message: "Request method is forbidden");
              case 500:
                return ErrorEntity(
                    code: errCode, message: "Server internal error");
              case 502:
                return ErrorEntity(code: errCode, message: "Invalid request");
              case 503:
                return ErrorEntity(
                    code: errCode, message: "The server is down");
              case 505:
                return ErrorEntity(
                    code: errCode,
                    message: "HTTP protocol requests are not supported");

              default:
                {
                  return ErrorEntity(
                      code: errCode,
                      message: error.response != null
                          ? error.response!.statusMessage!
                          : "");
                }
            }
          } on Exception catch (_) {
            return ErrorEntity(code: -1, message: "Unknown error");
          }
        }

      default:
        {
          return ErrorEntity(code: -1, message: error.message!);
        }
    }
  }
  void cancelRequests(CancelToken token){
    token.cancel('Cancelled');
  }
}

class ErrorEntity implements Exception {
  int code = -1;
  String message = '';
  ErrorEntity({required this.code, required this.message});

  @override
  String toString() {
    if (message == '') return "Exception";
    return "Exception: code $code, $message";
  }
}
