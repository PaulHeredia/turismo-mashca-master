import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mashcas_turismo/src/models/turismo_model.dart';

class TurismoService {
  TurismoService();

  Future<List<Turismo>?> getMantenimientos() async {
    List<Turismo> result = [];
    try {
      var url =
          Uri.parse('https://turismmascha-backend.web.app/api/mantenimiento');
      var response = await http.get(url);
      if (response.body.isEmpty) return result;
      List<dynamic> listBody = json.decode(response.body);
      for (var item in listBody) {
        var turismo = Turismo.fromJson(item);
        result.add(turismo);
      }
      return result;
    } catch (ex) {
      // ignore: avoid_print
      print(ex);
      return null;
    }
  }
}
