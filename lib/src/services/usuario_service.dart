import 'dart:convert';

import 'dart:developer' as developer;
import 'package:http/http.dart' as http;
import 'package:mashcas_turismo/src/models/usuario_model.dart';

class UsuarioService {
  UsuarioService();

  final String _firebaseAPIKey = 'AIzaSyBwdjG7lSK2CJ8wfLDpk-r8cJMRktZ2Xn8';

  Future<Map<String, dynamic>> login(Usuario usuario) async {
    try {
      final loginBody = {
        "email": usuario.email,
        "password": usuario.password,
        "returnSecureToken": true
      };
      final queryParams = {"key": _firebaseAPIKey};
      var uri = Uri.https("www.googleapis.com",
          "/identitytoolkit/v3/relyingparty/verifyPassword", queryParams);
      var response = await http.post(uri, body: json.encode(loginBody));
      if (response.body.isEmpty) return <String, dynamic>{};
      Map<String, dynamic> decodedResp = json.decode(response.body);
      developer.log(decodedResp.toString());
      return decodedResp;
    } catch (e) {
      developer.log(e.toString());
      return <String, dynamic>{};
    }
  }
}
