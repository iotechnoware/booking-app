class CustomCommonResponse<T>{
  T? data;
  int? statusCode;
  String? message;

  CustomCommonResponse.fromJson(Map<String,dynamic> json){
    try {
      this.statusCode = json['statusCode'];

      if (statusCode == 200) {
        if(json['response'] != null && json['response'] is Map) {
          this.data = json['response']['data'];
        }
      } else {
        if ( json['response'] != null && json['response'] is Map && json['response']['error'] != null )
        {
          this.message = json['response']['error'];
        }
        else {
          switch (statusCode)
          {
            case 400 :
              message = '300 Bad request';
              break;
            case 401 :
              message = '401 Unauthorized';
              break;
            case 500 :
              message = '500 Internal server error';
              break;
          }
        }
      }
    }
    catch(e){ print(e); }
  }

  bool get getStatus => statusCode == 200 ? true : false;

}