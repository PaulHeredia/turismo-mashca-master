import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

import 'package:mashcas_turismo/src/models/foto_model.dart';

class ExperienciaService {
  ExperienciaService();
  final String _urlRoot = "https://turismmascha-backend.web.app/api/foto";

  Future<int> postExperiencia(Foto foto) async {
    try {
      var uri = Uri.parse(_urlRoot);
      String _fotoBody = fotoToJson(foto);
      final Map<String, String> _headers = {"content-type": "application/json"};
      var response = await http.post(uri, headers: _headers, body: _fotoBody);
      if (response.body.isEmpty) return 400;
      Map<String, dynamic> content = json.decode(response.body);
      int result = content["estado"];
      developer.log("Estado $result");
      return result;
    } catch (ex) {
      developer.log("Error $ex");
      return 500;
    }
  }

  Future<String> uploadImage(File image) async {
    final cloudinary =
        CloudinaryPublic('turismo_mashca', 'Soyrockero19*', cache: false);
    try {
      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(image.path,
            resourceType: CloudinaryResourceType.Image),
      );
      return response.secureUrl;
    } on CloudinaryException catch (e) {
      developer.log(e.message!);
      return "";
    }
  }
}
