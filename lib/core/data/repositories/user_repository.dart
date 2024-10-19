
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:dartz/dartz.dart';
import 'package:gofly/core/data/models/apis/refresh_token_model.dart';
import 'package:gofly/core/data/models/apis/token_info.dart';
import 'package:gofly/core/data/models/common_response.dart';
import 'package:gofly/core/data/network/endpoints/user_endpoint.dart';
import 'package:gofly/core/data/network/network_config.dart';
import 'package:gofly/core/enums/request_type.dart';
import 'package:gofly/core/utils/network_util.dart';

class UserRepository {
  Future<Either<String, TokenInfo>> login({
    required String email,
    required String password,
    required String deviceName,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: UserEndpoints.login,
        body: {
          'email': email,
          'password': password,
          'device_name': deviceName,
        },
        headers: NetworkConfig.getHeaders(needAuth: false),
      ).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse = CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(TokenInfo.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> register({
    required String email,
    required String password,
    required String firstname,
    required String lastname,
    required String term,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: UserEndpoints.register,
        body: {
          'email': email,
          'first_name': firstname,
          'last_name': lastname,
          'password': password,
          "term": term
        },
        headers: NetworkConfig.getHeaders(needAuth: false),
      ).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse = CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(commonResponse.getStatus);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, RefreshTokenModel>> refreshToken() async {
    try {
      final response = await http.post(
        Uri.parse('https://test.api.amadeus.com/v1/security/oauth2/token'),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'client_id': 'T1npnafBkWBQgdySHqDWnLYpp66JSr66',
          'client_secret': '4yh4naPY3iUHvUWt',
          'grant_type': 'client_credentials',
        },
      );

      if (response.statusCode == 200) {
        return Right(RefreshTokenModel.fromJson(json.decode(response.body)));
      } else {
        return Left(response.body);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

}
