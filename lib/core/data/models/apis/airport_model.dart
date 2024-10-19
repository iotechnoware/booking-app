// class AirportModel {
//   String? icao;
//   String? iata;
//   String? name;
//   String? city;
//   String? region;
//   String? country;
//   String? elevationFt;
//   String? latitude;
//   String? longitude;
//   String? timezone;
//
//   AirportModel(
//       {this.icao,
//         this.iata,
//         this.name,
//         this.city,
//         this.region,
//         this.country,
//         this.elevationFt,
//         this.latitude,
//         this.longitude,
//         this.timezone});
//
//   AirportModel.fromJson(Map<String, dynamic> json) {
//     icao = json['icao'];
//     iata = json['iata'];
//     name = json['name'];
//     city = json['city'];
//     region = json['region'];
//     country = json['country'];
//     elevationFt = json['elevation_ft'];
//     latitude = json['latitude'];
//     longitude = json['longitude'];
//     timezone = json['timezone'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['icao'] = this.icao;
//     data['iata'] = this.iata;
//     data['name'] = this.name;
//     data['city'] = this.city;
//     data['region'] = this.region;
//     data['country'] = this.country;
//     data['elevation_ft'] = this.elevationFt;
//     data['latitude'] = this.latitude;
//     data['longitude'] = this.longitude;
//     data['timezone'] = this.timezone;
//     return data;
//   }
// }
