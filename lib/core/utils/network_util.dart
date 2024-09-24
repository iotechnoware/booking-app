import 'dart:convert';
import 'package:bot_toast/bot_toast.dart';
import 'package:gofly/core/enums/request_type.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'package:path/path.dart' as path;

import 'package:http_parser/http_parser.dart';

class NetworkUtil {
  static String baseUrl = 'booking.iotechnoware.com';
  static var client = http.Client();

  static Future<dynamic> sendRequest({
    required RequestType type,
    required String url,
    Map<String, dynamic>? params,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    try {
      var uri = Uri.http(baseUrl, url, params);
      late http.Response response;

      Map<String, dynamic> jsonResponse = {};

      switch (type) {
        case RequestType.GET:
          response = await client.get(uri, headers: headers);
          break;
        case RequestType.POST:
          response =
          await client.post(uri, headers: headers, body: jsonEncode(body));
          break;
        case RequestType.PUT:
          response =
          await client.put(uri, headers: headers, body: jsonEncode(body));
          break;
        case RequestType.DELETE:
          response = await client.delete(uri, headers: headers, body: jsonEncode(body));
          break;
        case RequestType.MULTIPART:
          break;
      }

      dynamic result;
      try {
        result = jsonDecode(utf8.decode(response.bodyBytes));
      } catch (e) {}

      jsonResponse.putIfAbsent('statusCode', () => response.statusCode);
      jsonResponse.putIfAbsent(
          'response',
              () => result != null
              ? result
              : {'title': utf8.decode(response.bodyBytes)});

      return jsonResponse;
    } catch (e) {
      print(e);
      BotToast.showText(text: e.toString());
    }
  }

  static Future<dynamic> sendMultipartRequest({
    required String url,
    required RequestType type,
    Map<String, String>? headers = const {},
    Map<String, String>? fields = const {},
    Map<String, String>? files = const {},
    Map<String, dynamic>? params,
  }) async {
    try {
      var request = http.MultipartRequest(type.name , Uri.https(baseUrl, url, params));

      var _filesKeyList = files!.keys.toList();

      var _filesNameList = files.values.toList();

      for (int i = 0; i < _filesKeyList.length; i++) {
        if (_filesNameList[i].isNotEmpty) {
          var multipartFile = http.MultipartFile.fromPath(
            _filesKeyList[i],
            _filesNameList[i],
            filename: path.basename(_filesNameList[i]),
            contentType: MediaType.parse(lookupMimeType(_filesNameList[i]) ?? ''),
          );
          request.files.add(await multipartFile);
        }
      }
      request.headers.addAll(headers!);
      request.fields.addAll(fields!);

      var response = await request.send();

      Map<String, dynamic> responseJson = {};
      var value;
      try {
        value = await response.stream.bytesToString();
      } catch (e) {
        print(e);
      }

      responseJson.putIfAbsent('statusCode', () => response.statusCode);
      responseJson.putIfAbsent('response', () => jsonDecode(value));

      return responseJson;
    } catch (error) {
      print(error.toString());
    }
  }


}
