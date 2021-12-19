import 'dart:convert';

Foto fotoFromJson(String str) => Foto.fromJson(json.decode(str));

String fotoToJson(Foto data) => json.encode(data.toJson());

class Foto {
  Foto({
    this.url,
    this.fechaHora,
  });

  String? url;
  DateTime? fechaHora;

  factory Foto.fromJson(Map<String, dynamic> json) => Foto(
        url: json["url"],
        fechaHora: DateTime.parse(json["fechaHora"]),
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "fechaHora": fechaHora!.toIso8601String(),
      };
}
