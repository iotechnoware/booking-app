class CustomResponse<T> {
  T? data;
  int? statusCode;
  String? message;

  CustomResponse.fromJson(Map<String, dynamic> json) {
    try {
      this.statusCode = json['statusCode'];

      if (statusCode == 200) {
          this.data = json['response']['data'];
      } else {
        if (json['response'] != null && json['response'] is Map && json['response']['error'] != null) {
          this.message = json['response']['error'];
        } else {
          switch (statusCode) {
            case 400:
              message = '400 Bad Request';
              break;
            case 401:
              message = '401 Unauthorized';
              break;
            case 500:
              message = '500 Internal Server Error';
              break;
            default:
              message = 'Unknown error occurred';
          }
        }
      }
    } catch (e) {
      print('Error parsing response: $e');
    }
  }

  bool get getStatus => statusCode == 200;
}