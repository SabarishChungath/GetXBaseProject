import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getx_base_project/api_repository/exceptions.dart';

var options = BaseOptions(
  connectTimeout: 30000,
  receiveTimeout: 30000,
);

class RestClient {
  late Dio dio;
  // BaseApiService() : dio = Dio(options);

  Future<RestClient> init() async {
    dio = Dio(options);
    initInterceptors();
    return this;
  }

  void initInterceptors() {
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      if (kDebugMode) {
        // ignore: avoid_print
        print('REQUEST[${options.method}] => PATH: ${options.path} '
            '=> Request Values: ${options.queryParameters}, => HEADERS: ${options.headers}');
      }
      return handler.next(options);
    }, onResponse: (response, handler) {
      if (kDebugMode) {
        // ignore: avoid_print
        print('RESPONSE[${response.statusCode}] => DATA: ${response.data}');
      }
      return handler.next(response);
    }, onError: (err, handler) {
      if (kDebugMode) {
        // ignore: avoid_print
        print('ERROR[${err.response?.statusCode}]');
      }
      return handler.next(err);
    }));
  }

  //get data
  getData({String? url, Map<String, dynamic>? headers}) async {
    if (url == null) {
      return;
    }
    try {
      dio.options.headers.addAll(headers ?? {});
      var response = await dio.get(url);
      return _processResponse(response);
    } on DioError catch (dioError) {
      throw _dioException(dioError);
    } catch (e) {
      rethrow;
    }
  }

  //post data
  postData(
      {String? url, dynamic payload, Map<String, dynamic>? headers}) async {
    if (url == null) {
      return;
    }
    try {
      if (headers != null) {
        dio.options.headers.addAll(headers);
      }
      var response = await dio.post(
        url,
        data: payload ?? {},
      );

      return _processResponse(response);
    } on DioError catch (dioError) {
      throw _dioException(dioError);
    } catch (e) {
      rethrow;
    }
  }

  //put data
  putData(
      {String? url,
      Map<String, dynamic>? payload,
      Map<String, dynamic>? headers}) async {
    if (url == null) {
      return;
    }
    try {
      if (headers != null) {
        dio.options.headers.addAll(headers);
      }
      var response = await dio.put(
        url,
        data: payload,
      );
      return _processResponse(response);
    } on DioError catch (dioError) {
      throw _dioException(dioError);
    } catch (e) {
      rethrow;
    }
  }

  //post data
  deleteData(
      {String? url, dynamic payload, Map<String, dynamic>? headers}) async {
    if (url == null) {
      return;
    }
    try {
      if (headers != null) {
        dio.options.headers.addAll(headers);
      }
      var response = await dio.delete(
        url,
        data: payload ?? {},
      );

      return _processResponse(response);
    } on DioError catch (dioError) {
      throw _dioException(dioError);
    } catch (e) {
      rethrow;
    }
  }

  _processResponse(response) {
    if (response == null) {
      return ClientException(message: "Something went wrong");
    }
    switch (response.statusCode) {
      case 200:
        var decodedJson = response.data;
        return decodedJson;
      case 400:
        var message = jsonDecode(response.toString())["message"];
        throw ClientException(message: message, response: response.data);
      case 401:
        var message = jsonDecode(response.toString())["message"];
        throw ClientException(message: message, response: response.data);
      case 404:
        var message = jsonDecode(response.toString())["message"];
        throw ClientException(message: message, response: response.data);
      case 500:
        throw ServerException(message: "Something went wrong");
      case 504:
        throw ServerException(message: "Server went down");
      default:
        throw HttpException(
            statusCode: response.statusCode, message: "Somwthing went wrong");
    }
  }

  _dioException(DioError dioErr) {
    switch (dioErr.type) {
      case DioErrorType.response:
        throw _processResponse(dioErr.response);
      case DioErrorType.sendTimeout:
        throw HttpException(
            statusCode: dioErr.response?.statusCode,
            message: "Something went wrong");
      case DioErrorType.receiveTimeout:
        throw HttpException(
            statusCode: dioErr.response?.statusCode,
            message: "Something went wrong");
      default:
        throw HttpException(
            statusCode: dioErr.response?.statusCode,
            message: "Something went wrong");
    }
  }
}
