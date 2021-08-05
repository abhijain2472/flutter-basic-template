import 'dart:convert';
import 'dart:io';
import 'package:basic_template/common/model/common_response.dart';
import 'package:basic_template/common/model/general_response.dart';
import 'package:basic_template/common/themes/app_strings.dart';
import 'package:basic_template/services/flavor/flavor_config.dart';
import 'package:basic_template/services/network/exceptions/exceptions.dart';
import 'package:dio/dio.dart';

/// api client in which main post get methods for api call is defined
class ApiClient {
  final Dio dio;

  ApiClient(this.dio) {
    dio.options.baseUrl = FlavorConfig.instance.baseUrl;
    dio.options.connectTimeout = const Duration(minutes: 3).inMilliseconds;
    dio.options.receiveTimeout = const Duration(minutes: 3).inMilliseconds;
    //TODO: need to fix
    dio.interceptors.add(LogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }

  /// post method for api call
  Future<Response> post(
    String path,
    dynamic data, {
    Function(int count, int total)? onSendProgress,
  }) async {
    try {
      return await dio.post(path,
          data: data, onSendProgress: onSendProgress ?? null);
    } on DioError catch (e) {
      print("DioError == $e");
      throw handleError(e);
    }
  }

  Future handleError(DioError e) {
    switch (e.type) {
      case DioErrorType.cancel:
        throw ApiException(errorMessage: AppStrings.commonErrorMsg);
      case DioErrorType.connectTimeout:
        throw ApiException(errorMessage: AppStrings.commonErrorMsg);
        break;
      case DioErrorType.sendTimeout:
        throw ApiException(errorMessage: AppStrings.commonErrorMsg);
        break;
      case DioErrorType.receiveTimeout:
        throw ApiException(errorMessage: AppStrings.commonErrorMsg);
        break;
      case DioErrorType.response:
        switch (e.response!.statusCode) {
          case 400:
            throw ApiException(
              errorMessage:
                  GeneralResponse.fromJson(json.decode(e.response?.data))
                      .error!
                      .message,
            );
          case 401:
            throw ApiException(
              errorMessage:
                  GeneralResponse.fromJson(json.decode(e.response?.data))
                      .error!
                      .message,
            );
          case 404:
            throw ApiException(
              errorMessage:
                  GeneralResponse.fromJson(json.decode(e.response?.data))
                      .error!
                      .message,
            );
          case 402:
            throw ApiException(
              errorMessage:
                  GeneralResponse.fromJson(json.decode(e.response?.data))
                      .error!
                      .message,
            );
          default:
            throw ApiException(
              errorMessage:
                  GeneralResponse.fromJson(json.decode(e.response?.data))
                      .error!
                      .message,
            );
        }
      case DioErrorType.other:
        if (e.error is SocketException) {
          throw ApiException(errorMessage: AppStrings.badNetworkErrorMsg);
        } else {
          throw ApiException(errorMessage: AppStrings.commonErrorMsg);
        }
      default:
        throw ApiException(errorMessage: AppStrings.commonErrorMsg);
    }
  }

  /// put method for api call
  Future<Response> put(String path, {dynamic data}) async {
    try {
      return await dio.put(path, data: data);
    } on DioError catch (e) {
      throw handleError(e);
    }
  }

  /// delete method for api call
  Future<Response> delete(String path, {dynamic data}) async {
    try {
      return await dio.delete(path, data: data);
    } on DioError catch (e) {
      throw handleError(e);
    }
  }

  /// get method for api call
  Future<Response> get(
    String path, {
    dynamic data,
  }) async {
    try {
      return await dio.get(path, queryParameters: data);
    } on DioError catch (e) {
      throw handleError(e);
    }
  }
}

/// class used for api errors
class ApiErrorResponse extends CommonResponse {
  ApiErrorResponse.fromJson(Map<String, dynamic> json) {
    this.error = (json['error'] != null ? Error.fromJson(json['error']) : null);
    this.status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.error != null) {
      data['error'] = this.error!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}
