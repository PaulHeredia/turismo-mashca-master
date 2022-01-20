// To parse this JSON data, do
//
//     final foto = fotoFromJson(jsonString);

import 'dart:convert';

Foto fotoFromJson(String str) => Foto.fromJson(json.decode(str));

String fotoToJson(Foto data) => json.encode(data.toJson());

class Foto {
  Foto({
    this.idfoto,
    this.fecha,
    this.url,
    this.nombreLugar,
    this.descripcionLugar,
    this.impresiones,
  });

  String? idfoto;
  DateTime? fecha;
  String? url;
  String? nombreLugar;
  String? descripcionLugar;
  String? impresiones;

  factory Foto.fromJson(Map<String, dynamic> json) => Foto(
        idfoto: json["idfoto"],
        fecha: DateTime.parse(json["fecha"]),
        url: json["url"],
        nombreLugar: json["nombre_lugar"],
        descripcionLugar: json["descripcion_lugar"],
        impresiones: json["impresiones"],
      );
  factory Foto.created(String id) => Foto(fecha: DateTime.now());

  Map<String, dynamic> toJson() => {
        "idfoto": idfoto,
        "fecha": fecha!.toIso8601String(),
        "url": url,
        "nombre_lugar": nombreLugar,
        "descripcion_lugar": descripcionLugar,
        "impresiones": impresiones,
      };
}
