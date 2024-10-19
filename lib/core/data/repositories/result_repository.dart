// import 'dart:convert';
//
// import 'package:dartz/dartz.dart';
// import 'package:gofly/core/data/models/apis/a.dart';
// import 'package:gofly/core/data/models/apis/flight_model.dart';
// import 'package:gofly/core/data/models/apis/result_model.dart';
// import 'package:gofly/core/data/models/common_response.dart';
// import 'package:gofly/core/data/models/custom_common_response.dart';
// import 'package:gofly/core/data/models/custom_response.dart';
// import 'package:gofly/core/data/network/endpoints/user_endpoint.dart';
// import 'package:gofly/core/data/network/network_config.dart';
// import 'package:gofly/core/enums/request_type.dart';
// import 'package:gofly/core/utils/network_util.dart';
// import 'package:gofly/ui/shared/utils.dart';
//
//
//
// // class ResultRepository {
// //   Future<Either<String, List<ResultModel>>> getAll({
// //     required String origin,
// //     required String destination,
// //     final String? departureAt,
// //     final String? returnAt,
// //     final String? adult,
// //     final String? max,
// //     final bool? nonStop,
// //   }) async {
// //     try {
// //       // Prepare parameters
// //       final params = {
// //         'originLocationCode': origin.toUpperCase(),
// //         'destinationLocationCode': destination.toUpperCase(),
// //         'departureDate': departureAt,
// //         'returnDate': returnAt,
// //         'adults': adult,
// //         'max': max,
// //         'nonStop': nonStop?.toString(), // Ensure boolean is converted to string
// //       };
// //
// //       // Log parameters for debugging
// //       print('Request parameters: $params');
// //
// //       // Send the request
// //       final response = await NetworkUtil.customSendRequest(
// //         customUrl: 'test.api.amadeus.com',
// //         type: RequestType.GET,
// //         url: '/v2/shopping/flight-offers',
// //         params: params,
// //         headers: {
// //           'Authorization': 'Bearer ${storage.getRefreshToken()?.accessToken ?? ''}',
// //         },
// //       );
// //
// //       // Log the raw response for debugging
// //       print('Raw response: $response');
// //
// //       // Check if the response is valid and contains data
// //       if (response != null && response['data'] != null) {
// //         List<ResultModel> result = (response['data'] as List)
// //             .map((element) => ResultModel.fromJson(element))
// //             .toList();
// //
// //         return Right(result);
// //       } else {
// //         // Handle error case based on response structure
// //         String errorMessage = response?['message'] ?? 'Unknown error occurred';
// //         return Left(errorMessage);
// //       }
// //     } catch (e) {
// //       // Log the error for debugging
// //       print('Error occurred: $e');
// //       return Left(e.toString());
// //     }
// //   }
// // }
//
//
//
// class FlightOffersRepository {
//   Future<Either<String, List<dynamic>>> fetchFlightOffers({
//     required String origin,
//     required String destination,
//     String? departureAt,
//     String? returnAt,
//     String? adult,
//     String? max,
//     bool? nonStop,
//   }) async {
//     try {
//       // Prepare parameters
//       final params = {
//         'originLocationCode': origin.toUpperCase(),
//         'destinationLocationCode': destination.toUpperCase(),
//         if (departureAt != null) 'departureDate': departureAt,
//         if (returnAt != null) 'returnDate': returnAt,
//         if (adult != null) 'adults': adult,
//         if (max != null) 'max': max,
//         if (nonStop != null) 'nonStop': nonStop.toString(), // Convert boolean to string
//       };
//
//       // Log parameters for debugging
//       print('Request parameters: $params');
//
//       // Send the request
//       final response = await NetworkUtil.customSendRequest(
//         customUrl: 'test.api.amadeus.com',
//         type: RequestType.GET,
//         url: '/v2/shopping/flight-offers',
//         params: params,
//         headers: {
//           'Authorization': 'Bearer ${storage.getRefreshToken()?.accessToken ?? ''}',
//         },
//       );
//
//       // Log the raw response for debugging
//       print('Raw response: $response');
//
//       // Check if the response is valid and contains data
//       if (response == null) {
//         return Left('No response received from server');
//       }
//
//       if (response['statusCode'] != 200) {
//         String errorMessage = response['message'] ?? 'Unknown error occurred';
//         return Left(errorMessage);
//       }
//
//       // Extract the data field from the nested response
//       final dynamic data = response['response']['data'];
//
//       // Log the type of data for debugging
//       print('Data type: ${data.runtimeType}');
//
//       // Check if data is indeed a List
//       if (data is List<dynamic>) {
//         return Right(data);  // Return the list of flight offers
//       } else {
//         return Left('Data format is incorrect, expected a List.');
//       }
//
//     } catch (e) {
//       // Log the error for debugging
//       print('Error occurred: $e');
//       return Left(e.toString());
//     }
//   }
//
//
//
//   Future<Either<String, dynamic>> getPricing(Map<String,dynamic> flightOffers) async {
//     try {
//       final response = await NetworkUtil.customSendRequest(
//         customUrl: 'test.api.amadeus.com',
//         type: RequestType.POST,
//         url: '/v1/shopping/flight-offers/pricing',
//         body: {
//           "data": {
//             "type": "flight-offers-pricing",
//             "flightOffers": [
//               flightOffers
//             ]
//           }
//         },
//         headers: {
//           'Authorization': 'Bearer ${storage.getRefreshToken()?.accessToken ?? ''}',
//           'Content-Type': 'application/json',
//           'X-HTTP-Method-Override': 'GET',
//         },
//       );
//
//       print('Raw pricing response: $response');
//       if (response == null) {
//         return const Left('No response received from server');
//       }
//
//       if (response['statusCode'] != 200) {
//         String errorMessage = response['message'] ?? 'Unknown error occurred';
//         return Left(errorMessage);
//       }
//       return Right(response['response']);
//     } catch (e) {
//       print('Error occurred during pricing: $e');
//       return Left(e.toString());
//     }
//   }
//
//   Future<Either<String, dynamic>> createOrder(Map<String,dynamic> priceOffer) async {
//     try {
//       final response = await NetworkUtil.customSendRequest(
//         customUrl: 'test.api.amadeus.com',
//         type: RequestType.POST,
//         url: '/v1/booking/flight-orders',
//         body: {
//           "data": {
//             "type": "flight-order",
//             "flightOffers": [
//               priceOffer
//             ],
//             "travelers": [
//               {
//                 "id": "1",
//                 "dateOfBirth": "1982-01-16",
//                 "name": {
//                   "firstName": "JORGE",
//                   "lastName": "GONZALES"
//                 },
//                 "gender": "MALE",
//                 "contact": {
//                   "emailAddress": "jorge.gonzales833@telefonica.es",
//                   "phones": [
//                     {
//                       "deviceType": "MOBILE",
//                       "countryCallingCode": "34",
//                       "number": "480080076"
//                     }
//                   ]
//                 },
//                 "documents": [
//                   {
//                     "documentType": "PASSPORT",
//                     "birthPlace": "Madrid",
//                     "issuanceLocation": "Madrid",
//                     "issuanceDate": "2015-04-14",
//                     "number": "00000000",
//                     "expiryDate": "2025-04-14",
//                     "issuanceCountry": "ES",
//                     "validityCountry": "ES",
//                     "nationality": "ES",
//                     "holder": true
//                   }
//                 ]
//               }
//             ]
//           }
//         },
//         headers: {
//           'Authorization': 'Bearer ${storage.getRefreshToken()?.accessToken ?? ''}',
//           'Content-Type': 'application/json',
//         },
//       );
//
//       print('Raw pricing response: $response');
//       if (response == null) {
//         return const Left('No response received from server');
//       }
//
//       if (response['statusCode'] != 201) {
//         String errorMessage = response['message'] ?? 'Unknown error occurred';
//         return Left(errorMessage);
//       }
//       return Right(response['response']);
//
//     } catch (e) {
//       print('Error occurred during pricing: $e');
//       return Left(e.toString());
//     }
//   }
//
//
// }
//
