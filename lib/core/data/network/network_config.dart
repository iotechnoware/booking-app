
import 'package:gofly/core/enums/request_type.dart';
import 'package:gofly/ui/shared/utils.dart';

class NetworkConfig {
  static String BASE_API = '/api/';

  static String getFullApiUrl(String api) {
    return BASE_API + api;
  }

  static Map<String, String> getHeaders(
      {bool? needAuth = true,
        RequestType? type = RequestType.POST,
        Map<String, String>? extraHeaders = const {}}) {
    return {
      if (needAuth!)
        'Authorization':
        'Bearer ${storage.getTokenInfo()?.accessToken ?? ''}',
      if (type != RequestType.GET) 'Content-Type': 'application/json',
      ...extraHeaders!
    };
  }
}