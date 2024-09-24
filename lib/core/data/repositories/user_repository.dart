


import 'package:dartz/dartz.dart';
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
}
