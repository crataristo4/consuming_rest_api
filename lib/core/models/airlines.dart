class Airline {
  Airline({
    this.id,
    this.fleetAverageAge,
    this.airlineId,
    this.callsign,
    this.hubCode,
    this.iataCode,
    this.icaoCode,
    this.countryIso2,
    this.dateFounded,
    this.iataPrefixAccounting,
    this.airlineName,
    this.countryName,
    this.fleetSize,
    this.status,
    this.type,
  });

  String? id;
  String? fleetAverageAge;
  String? airlineId;
  String? callsign;
  String? hubCode;
  String? iataCode;
  String? icaoCode;
  String? countryIso2;
  String? dateFounded;
  String? iataPrefixAccounting;
  String? airlineName;
  String? countryName;
  String? fleetSize;
  String? status;
  String? type;

  factory Airline.fromJson(Map<String, dynamic> json) => Airline(
        id: json["id"],
        fleetAverageAge: json["fleet_average_age"],
        airlineId: json["airline_id"],
        callsign: json["callsign"],
        hubCode: json["hub_code"],
        iataCode: json["iata_code"],
        icaoCode: json["icao_code"],
        countryIso2: json["country_iso2"],
        dateFounded: json["date_founded"],
        iataPrefixAccounting: json["iata_prefix_accounting"],
        airlineName: json["airline_name"],
        countryName: json["country_name"],
        fleetSize: json["fleet_size"],
        status: json["status"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fleet_average_age": fleetAverageAge,
        "airline_id": airlineId,
        "callsign": callsign,
        "hub_code": hubCode,
        "iata_code": iataCode,
        "icao_code": icaoCode,
        "country_iso2": countryIso2,
        "date_founded": dateFounded,
        "iata_prefix_accounting": iataPrefixAccounting,
        "airline_name": airlineName,
        "country_name": countryName,
        "fleet_size": fleetSize,
        "status": status,
        "type": type,
      };
}
