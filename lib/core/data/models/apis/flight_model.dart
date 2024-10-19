class FlightModel {
  String? flightNumber;
  String? link;
  String? originAirport;
  String? destinationAirport;
  String? departureAt;
  String? airline;
  String? destination;
  String? returnAt;
  String? origin;
  int? price;
  int? returnTransfers;
  int? duration;
  int? durationTo;
  int? durationBack;
  int? transfers;

  FlightModel(
      {this.flightNumber,
        this.link,
        this.originAirport,
        this.destinationAirport,
        this.departureAt,
        this.airline,
        this.destination,
        this.returnAt,
        this.origin,
        this.price,
        this.returnTransfers,
        this.duration,
        this.durationTo,
        this.durationBack,
        this.transfers});

  FlightModel.fromJson(Map<String, dynamic> json) {
    flightNumber = json['flight_number'];
    link = json['link'];
    originAirport = json['origin_airport'];
    destinationAirport = json['destination_airport'];
    departureAt = json['departure_at'];
    airline = json['airline'];
    destination = json['destination'];
    returnAt = json['return_at'];
    origin = json['origin'];
    price = json['price'];
    returnTransfers = json['return_transfers'];
    duration = json['duration'];
    durationTo = json['duration_to'];
    durationBack = json['duration_back'];
    transfers = json['transfers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flight_number'] = this.flightNumber;
    data['link'] = this.link;
    data['origin_airport'] = this.originAirport;
    data['destination_airport'] = this.destinationAirport;
    data['departure_at'] = this.departureAt;
    data['airline'] = this.airline;
    data['destination'] = this.destination;
    data['return_at'] = this.returnAt;
    data['origin'] = this.origin;
    data['price'] = this.price;
    data['return_transfers'] = this.returnTransfers;
    data['duration'] = this.duration;
    data['duration_to'] = this.durationTo;
    data['duration_back'] = this.durationBack;
    data['transfers'] = this.transfers;
    return data;
  }
}
