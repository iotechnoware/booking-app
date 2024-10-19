import 'package:dartz/dartz.dart';
import 'package:gofly/core/data/models/apis/airport_mode.dart';
import 'package:gofly/core/data/models/apis/airport_model.dart';
import 'package:gofly/core/data/models/common_response.dart';
import 'package:gofly/core/data/models/custom_common_response.dart';
import 'package:gofly/core/data/network/endpoints/user_endpoint.dart';
import 'package:gofly/core/data/network/network_config.dart';
import 'package:gofly/core/enums/request_type.dart';
import 'package:gofly/core/utils/network_util.dart';
import 'package:gofly/ui/shared/utils.dart';

class SuggestionsRepository {
  // Future<Either<String, List<AirportModel>>> getAll({required String query}) async {
  //   try {
  //     return NetworkUtil.customSendRequest(
  //       customUrl: 'api.api-ninjas.com',
  //       type: RequestType.GET,
  //       url: '/v1/airports',
  //       headers: {
  //         'X-Api-Key' : 'uzsNkQttcSdGsKHdWeVZJw==sTprz1oc78FV8wlZ'
  //       },
  //       params: {
  //         'name' : query.toLowerCase()
  //       }
  //     ).then((response) {
  //       CommonResponse<List<dynamic>> commonResponse = CommonResponse.fromJson(response);
  //
  //       if (commonResponse.getStatus) {
  //         List<AirportModel> result = [];
  //         commonResponse.data!.forEach((element) {
  //           result.add(AirportModel.fromJson(element));
  //         },
  //         );
  //         return Right(result);
  //       } else {
  //         return Left(commonResponse.message ?? '');
  //       }
  //     });
  //   } catch (e) {
  //     return Left(e.toString());
  //   }
  // }

  Future<Either<String, List<AirportModel>>> getSuggestions(
      {required String query}) async {
    try {
      final response = await NetworkUtil.customSendRequest(
        customUrl: 'test.api.amadeus.com',
        type: RequestType.GET,
        url: '/v1/reference-data/locations/cities',
        headers: {
          'Authorization': 'Bearer ${storage.getRefreshToken()?.accessToken ?? ''}',
        },
        params: {
          'keyword': query.toLowerCase(),
          'max': '10',
        },
      );

      // Log the raw response for debugging
      print('Raw response: $response');

      if (response['statusCode'] == 200) {
        // Accessing the nested data field
        List<dynamic> data = response['response']['data'];

        // Mapping to Data model directly instead of AirportModel
        List<Data> result = data.map((element) => Data.fromJson(element)).toList();

        // Wrap results in AirportModel if needed (if AirportModel is meant to hold a list)
        AirportModel airportModel = AirportModel(data: result);

        return Right([airportModel]); // Return as a list containing one AirportModel
      } else {
        return Left(response['response']['meta']['message'] ?? 'Unknown error');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}