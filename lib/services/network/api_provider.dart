import 'dart:convert';
import 'dart:io';
import 'package:basic_template/common/model/general_response.dart';
import 'package:basic_template/common/model/profile_response.dart';
import 'package:dio/dio.dart';
import 'package:package_info/package_info.dart';

import 'api_client/api_client.dart';

/// api provider from which all api calls are defined & called.
class APIProviderIml {
  final Dio _dio = Dio();

  static APIProviderIml? _instance;
  late ApiClient _apiClient;

  APIProviderIml._() {
    _apiClient = ApiClient(_dio);
    print("APIProviderIml()");
  }

  /// get instance of api provider
  static Future<APIProviderIml> getInstance() async {
    if (_instance == null) {
      _instance = APIProviderIml._();
    }
    return _instance!;
  }

  /// api call for sign out user from app
  Future<GeneralResponse> getLanguage() async {
    var response;
    print("===== getLanguage Response Start =======");
    response = await _apiClient.get("/common/get/language");
    print(response?.data);
    print("===== getLanguage Response End =======");
    return GeneralResponse.fromJson(
      json.decode(response?.data),
    );
  }

  /// api call for get all details of user through id
  Future<ProfileResponse> getUserProfile({
    required String userId,
    String languageCode = 'EN',
  }) async {
    var response;
    print("===== getUserProfile Response Start =======");
    response = await _apiClient.get("/user/get-user-profile", data: {
      'code': languageCode,
      'user_id': userId,
      // 'current_user_id': currentUserId,
    });
    print(response?.data);
    print("===== getUserProfile Response End =======");
    return ProfileResponse.fromJson(
      json.decode(response?.data),
    );
  }


}
