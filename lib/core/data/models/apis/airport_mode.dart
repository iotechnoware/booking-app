class AirportModel {
  List<Data>? data;

  AirportModel({this.data});

  AirportModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? type;
  String? subType;
  String? name;
  String? iataCode;
  Address? address;
  GeoCode? geoCode;

  Data(
      {this.type,
        this.subType,
        this.name,
        this.iataCode,
        this.address,
        this.geoCode});

  Data.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    subType = json['subType'];
    name = json['name'];
    iataCode = json['iataCode'];
    address =
    json['address'] != null ? Address.fromJson(json['address']) : null;
    geoCode =
    json['geoCode'] != null ? GeoCode.fromJson(json['geoCode']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = type;
    data['subType'] = subType;
    data['name'] = name;
    data['iataCode'] = iataCode;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    if (geoCode != null) {
      data['geoCode'] = geoCode!.toJson();
    }
    return data;
  }
}

class Address {
  String? countryCode;
  String? stateCode;

  Address({this.countryCode, this.stateCode});

  Address.fromJson(Map<String, dynamic> json) {
    countryCode = json['countryCode'];
    stateCode = json['stateCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['countryCode'] = countryCode;
    data['stateCode'] = stateCode;
    return data;
  }
}

class GeoCode {
  double? latitude;
  double? longitude;

  GeoCode({this.latitude, this.longitude});

  GeoCode.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}
