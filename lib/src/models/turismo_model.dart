// To parse this JSON data, do
//
//     final turismo = turismoFromJson(jsonString);
import 'dart:convert';

Turismo turismoFromJson(String str) => Turismo.fromJson(json.decode(str));

class Turismo {
  Turismo(
      {this.nombre,
      this.descripcion,
      this.imagen,
      this.lat,
      this.lng,
      this.calificacion});

  String? nombre;
  String? descripcion;
  String? imagen;
  double? lat;
  double? lng;
  double? calificacion;
  factory Turismo.fromJson(Map<String, dynamic> json) => Turismo(
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        imagen: json["imagen"],
        lat: json["lat"],
        lng: json["lng"],
        calificacion: json["calificacion"],
      );
}
