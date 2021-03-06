// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  Usuario({this.displayName, this.email, this.password, this.userName});

  String? displayName;
  String? email;
  String? password;
  String? userName;

  Map<String, dynamic> toJson() => {
        "displayName": displayName,
        "email": email,
        "password": password,
        "userName": userName,
      };
}
