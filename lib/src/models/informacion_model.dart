// To parse this JSON data, do
//
//     final informacion = informacionFromJson(jsonString);

import 'dart:convert';

Informacion informacionFromJson(String str) =>
    Informacion.fromJson(json.decode(str));

class Informacion {
  Informacion({
    this.lng,
    this.lat,
  });

  double? lng;
  double? lat;

  factory Informacion.fromJson(Map<String, dynamic> json) => Informacion(
        lng: json["lng"],
        lat: json["lat"],
      );
}
