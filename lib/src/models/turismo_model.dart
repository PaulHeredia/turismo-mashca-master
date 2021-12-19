// To parse this JSON data, do
//
//     final turismo = turismoFromJson(jsonString);
import 'dart:convert';

Turismo turismoFromJson(String str) => Turismo.fromJson(json.decode(str));

String turismoToJson(Turismo data) => json.encode(data.toJson());

class Turismo {
  Turismo({
    this.nombre,
    this.descripcion,
    this.imagen,
    this.longitud,
    this.latitud,
  });

  String? nombre;
  String? descripcion;
  String? imagen;
  double? longitud;
  double? latitud;

  factory Turismo.fromJson(Map<String, dynamic> json) => Turismo(
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        imagen: json["imagen"],
        longitud: json["longitud"].toDouble(),
        latitud: json["latitud"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "descripcion": descripcion,
        "imagen": imagen,
        "longitud": longitud,
        "latitud": latitud,
      };
}
