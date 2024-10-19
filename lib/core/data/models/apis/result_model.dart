class ResultModel {
  ResultModel({
    required this.meta,
    required this.data,
    required this.dictionaries,
  });

  final Meta? meta;
  final List<Data> data;
  final Dictionaries? dictionaries;

  factory ResultModel.fromJson(Map<String, dynamic> json){
    return ResultModel(
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      data: json["data"] == null ? [] : List<Data>.from(json["data"]!.map((x) => Data.fromJson(x))),
      dictionaries: json["dictionaries"] == null ? null : Dictionaries.fromJson(json["dictionaries"]),
    );
  }

}

class Data {
  Data({
    required this.type,
    required this.id,
    required this.source,
    required this.instantTicketingRequired,
    required this.nonHomogeneous,
    required this.oneWay,
    required this.isUpsellOffer,
    required this.lastTicketingDate,
    required this.lastTicketingDateTime,
    required this.numberOfBookableSeats,
    required this.itineraries,
    required this.price,
    required this.pricingOptions,
    required this.validatingAirlineCodes,
    required this.travelerPricings,
  });

  final String type;
  final String id;
  final String source;
  final bool instantTicketingRequired;
  final bool nonHomogeneous;
  final bool oneWay;
  final bool isUpsellOffer;
  final DateTime? lastTicketingDate;
  final DateTime? lastTicketingDateTime;
  final int numberOfBookableSeats;
  final List<Itinerary> itineraries;
  final DataPrice? price;
  final PricingOptions? pricingOptions;
  final List<String> validatingAirlineCodes;
  final List<TravelerPricing> travelerPricings;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      type: json["type"] ?? "",
      id: json["id"] ?? "",
      source: json["source"] ?? "",
      instantTicketingRequired: json["instantTicketingRequired"] ?? false,
      nonHomogeneous: json["nonHomogeneous"] ?? false,
      oneWay: json["oneWay"] ?? false,
      isUpsellOffer: json["isUpsellOffer"] ?? false,
      lastTicketingDate: DateTime.tryParse(json["lastTicketingDate"] ?? ""),
      lastTicketingDateTime: DateTime.tryParse(json["lastTicketingDateTime"] ?? ""),
      numberOfBookableSeats: json["numberOfBookableSeats"] ?? 0,
      itineraries: json["itineraries"] == null ? [] : List<Itinerary>.from(json["itineraries"]!.map((x) => Itinerary.fromJson(x))),
      price: json["price"] == null ? null : DataPrice.fromJson(json["price"]),
      pricingOptions: json["pricingOptions"] == null ? null : PricingOptions.fromJson(json["pricingOptions"]),
      validatingAirlineCodes: json["validatingAirlineCodes"] == null ? [] : List<String>.from(json["validatingAirlineCodes"]!.map((x) => x)),
      travelerPricings: json["travelerPricings"] == null ? [] : List<TravelerPricing>.from(json["travelerPricings"]!.map((x) => TravelerPricing.fromJson(x))),
    );
  }

}

class Itinerary {
  Itinerary({
    required this.duration,
    required this.segments,
  });

  final String duration;
  final List<Segment> segments;

  factory Itinerary.fromJson(Map<String, dynamic> json){
    return Itinerary(
      duration: json["duration"] ?? "",
      segments: json["segments"] == null ? [] : List<Segment>.from(json["segments"]!.map((x) => Segment.fromJson(x))),
    );
  }

}

class Segment {
  Segment({
    required this.departure,
    required this.arrival,
    required this.carrierCode,
    required this.number,
    required this.aircraft,
    required this.operating,
    required this.duration,
    required this.id,
    required this.numberOfStops,
    required this.blacklistedInEu,
  });

  final Arrival? departure;
  final Arrival? arrival;
  final String carrierCode;
  final String number;
  final SegmentAircraft? aircraft;
  final Operating? operating;
  final String duration;
  final String id;
  final int numberOfStops;
  final bool blacklistedInEu;

  factory Segment.fromJson(Map<String, dynamic> json){
    return Segment(
      departure: json["departure"] == null ? null : Arrival.fromJson(json["departure"]),
      arrival: json["arrival"] == null ? null : Arrival.fromJson(json["arrival"]),
      carrierCode: json["carrierCode"] ?? "",
      number: json["number"] ?? "",
      aircraft: json["aircraft"] == null ? null : SegmentAircraft.fromJson(json["aircraft"]),
      operating: json["operating"] == null ? null : Operating.fromJson(json["operating"]),
      duration: json["duration"] ?? "",
      id: json["id"] ?? "",
      numberOfStops: json["numberOfStops"] ?? 0,
      blacklistedInEu: json["blacklistedInEU"] ?? false,
    );
  }

}

class SegmentAircraft {
  SegmentAircraft({
    required this.code,
  });

  final String code;

  factory SegmentAircraft.fromJson(Map<String, dynamic> json){
    return SegmentAircraft(
      code: json["code"] ?? "",
    );
  }

}

class Arrival {
  Arrival({
    required this.iataCode,
    required this.terminal,
    required this.at,
  });

  final String iataCode;
  final String terminal;
  final DateTime? at;

  factory Arrival.fromJson(Map<String, dynamic> json){
    return Arrival(
      iataCode: json["iataCode"] ?? "",
      terminal: json["terminal"] ?? "",
      at: DateTime.tryParse(json["at"] ?? ""),
    );
  }

}

class Operating {
  Operating({
    required this.carrierCode,
  });

  final String carrierCode;

  factory Operating.fromJson(Map<String, dynamic> json){
    return Operating(
      carrierCode: json["carrierCode"] ?? "",
    );
  }

}

class DataPrice {
  DataPrice({
    required this.currency,
    required this.total,
    required this.base,
    required this.fees,
    required this.grandTotal,
  });

  final String currency;
  final String total;
  final String base;
  final List<Fee> fees;
  final String grandTotal;

  factory DataPrice.fromJson(Map<String, dynamic> json){
    return DataPrice(
      currency: json["currency"] ?? "",
      total: json["total"] ?? "",
      base: json["base"] ?? "",
      fees: json["fees"] == null ? [] : List<Fee>.from(json["fees"]!.map((x) => Fee.fromJson(x))),
      grandTotal: json["grandTotal"] ?? "",
    );
  }

}

class Fee {
  Fee({
    required this.amount,
    required this.type,
  });

  final String amount;
  final String type;

  factory Fee.fromJson(Map<String, dynamic> json){
    return Fee(
      amount: json["amount"] ?? "",
      type: json["type"] ?? "",
    );
  }

}

class PricingOptions {
  PricingOptions({
    required this.fareType,
    required this.includedCheckedBagsOnly,
  });

  final List<String> fareType;
  final bool includedCheckedBagsOnly;

  factory PricingOptions.fromJson(Map<String, dynamic> json){
    return PricingOptions(
      fareType: json["fareType"] == null ? [] : List<String>.from(json["fareType"]!.map((x) => x)),
      includedCheckedBagsOnly: json["includedCheckedBagsOnly"] ?? false,
    );
  }

}

class TravelerPricing {
  TravelerPricing({
    required this.travelerId,
    required this.fareOption,
    required this.travelerType,
    required this.price,
    required this.fareDetailsBySegment,
  });

  final String travelerId;
  final String fareOption;
  final String travelerType;
  final TravelerPricingPrice? price;
  final List<FareDetailsBySegment> fareDetailsBySegment;

  factory TravelerPricing.fromJson(Map<String, dynamic> json){
    return TravelerPricing(
      travelerId: json["travelerId"] ?? "",
      fareOption: json["fareOption"] ?? "",
      travelerType: json["travelerType"] ?? "",
      price: json["price"] == null ? null : TravelerPricingPrice.fromJson(json["price"]),
      fareDetailsBySegment: json["fareDetailsBySegment"] == null ? [] : List<FareDetailsBySegment>.from(json["fareDetailsBySegment"]!.map((x) => FareDetailsBySegment.fromJson(x))),
    );
  }

}

class FareDetailsBySegment {
  FareDetailsBySegment({
    required this.segmentId,
    required this.cabin,
    required this.fareBasis,
    required this.brandedFare,
    required this.brandedFareLabel,
    required this.fareDetailsBySegmentClass,
    required this.includedCheckedBags,
    required this.amenities,
  });

  final String segmentId;
  final String cabin;
  final String fareBasis;
  final String brandedFare;
  final String brandedFareLabel;
  final String fareDetailsBySegmentClass;
  final IncludedCheckedBags? includedCheckedBags;
  final List<Amenity> amenities;

  factory FareDetailsBySegment.fromJson(Map<String, dynamic> json){
    return FareDetailsBySegment(
      segmentId: json["segmentId"] ?? "",
      cabin: json["cabin"] ?? "",
      fareBasis: json["fareBasis"] ?? "",
      brandedFare: json["brandedFare"] ?? "",
      brandedFareLabel: json["brandedFareLabel"] ?? "",
      fareDetailsBySegmentClass: json["class"] ?? "",
      includedCheckedBags: json["includedCheckedBags"] == null ? null : IncludedCheckedBags.fromJson(json["includedCheckedBags"]),
      amenities: json["amenities"] == null ? [] : List<Amenity>.from(json["amenities"]!.map((x) => Amenity.fromJson(x))),
    );
  }

}

class Amenity {
  Amenity({
    required this.description,
    required this.isChargeable,
    required this.amenityType,
    required this.amenityProvider,
  });

  final String description;
  final bool isChargeable;
  final String amenityType;
  final AmenityProvider? amenityProvider;

  factory Amenity.fromJson(Map<String, dynamic> json){
    return Amenity(
      description: json["description"] ?? "",
      isChargeable: json["isChargeable"] ?? false,
      amenityType: json["amenityType"] ?? "",
      amenityProvider: json["amenityProvider"] == null ? null : AmenityProvider.fromJson(json["amenityProvider"]),
    );
  }

}

class AmenityProvider {
  AmenityProvider({
    required this.name,
  });

  final String name;

  factory AmenityProvider.fromJson(Map<String, dynamic> json){
    return AmenityProvider(
      name: json["name"] ?? "",
    );
  }

}

class IncludedCheckedBags {
  IncludedCheckedBags({
    required this.weight,
    required this.weightUnit,
  });

  final int weight;
  final String weightUnit;

  factory IncludedCheckedBags.fromJson(Map<String, dynamic> json){
    return IncludedCheckedBags(
      weight: json["weight"] ?? 0,
      weightUnit: json["weightUnit"] ?? "",
    );
  }

}

class TravelerPricingPrice {
  TravelerPricingPrice({
    required this.currency,
    required this.total,
    required this.base,
  });

  final String currency;
  final String total;
  final String base;

  factory TravelerPricingPrice.fromJson(Map<String, dynamic> json){
    return TravelerPricingPrice(
      currency: json["currency"] ?? "",
      total: json["total"] ?? "",
      base: json["base"] ?? "",
    );
  }

}

class Dictionaries {
  Dictionaries({
    required this.locations,
    required this.aircraft,
    required this.currencies,
    required this.carriers,
  });

  final Locations? locations;
  final DictionariesAircraft? aircraft;
  final Currencies? currencies;
  final Carriers? carriers;

  factory Dictionaries.fromJson(Map<String, dynamic> json){
    return Dictionaries(
      locations: json["locations"] == null ? null : Locations.fromJson(json["locations"]),
      aircraft: json["aircraft"] == null ? null : DictionariesAircraft.fromJson(json["aircraft"]),
      currencies: json["currencies"] == null ? null : Currencies.fromJson(json["currencies"]),
      carriers: json["carriers"] == null ? null : Carriers.fromJson(json["carriers"]),
    );
  }

}

class DictionariesAircraft {
  DictionariesAircraft({
    required this.the388,
    required this.the77W,
  });

  final String the388;
  final String the77W;

  factory DictionariesAircraft.fromJson(Map<String, dynamic> json){
    return DictionariesAircraft(
      the388: json["388"] ?? "",
      the77W: json["77W"] ?? "",
    );
  }

}

class Carriers {
  Carriers({
    required this.ek,
  });

  final String ek;

  factory Carriers.fromJson(Map<String, dynamic> json){
    return Carriers(
      ek: json["EK"] ?? "",
    );
  }

}

class Currencies {
  Currencies({
    required this.eur,
  });

  final String eur;

  factory Currencies.fromJson(Map<String, dynamic> json){
    return Currencies(
      eur: json["EUR"] ?? "",
    );
  }

}

class Locations {
  Locations({
    required this.dus,
    required this.dxb,
  });

  final Dus? dus;
  final Dus? dxb;

  factory Locations.fromJson(Map<String, dynamic> json){
    return Locations(
      dus: json["DUS"] == null ? null : Dus.fromJson(json["DUS"]),
      dxb: json["DXB"] == null ? null : Dus.fromJson(json["DXB"]),
    );
  }

}

class Dus {
  Dus({
    required this.cityCode,
    required this.countryCode,
  });

  final String cityCode;
  final String countryCode;

  factory Dus.fromJson(Map<String, dynamic> json){
    return Dus(
      cityCode: json["cityCode"] ?? "",
      countryCode: json["countryCode"] ?? "",
    );
  }

}

class Meta {
  Meta({
    required this.count,
    required this.links,
  });

  final int count;
  final Links? links;

  factory Meta.fromJson(Map<String, dynamic> json){
    return Meta(
      count: json["count"] ?? 0,
      links: json["links"] == null ? null : Links.fromJson(json["links"]),
    );
  }

}

class Links {
  Links({
    required this.self,
  });

  final String self;

  factory Links.fromJson(Map<String, dynamic> json){
    return Links(
      self: json["self"] ?? "",
    );
  }

}
