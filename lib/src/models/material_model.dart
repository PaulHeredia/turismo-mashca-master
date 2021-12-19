// To parse this JSON data, do
//
//     final material = materialFromJson(jsonString);

import 'dart:convert';

Material materialFromJson(String str) => Material.fromJson(json.decode(str));

String materialToJson(Material data) => json.encode(data.toJson());

class Material {
  Material({
    required this.nombre,
    required this.descripcion,
    required this.imagen,
  });

  String nombre;
  String descripcion;
  String imagen;

  factory Material.fromJson(Map<String, dynamic> json) => Material(
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        imagen: json["imagen"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "descripcion": descripcion,
        "imagen": imagen,
      };
}
