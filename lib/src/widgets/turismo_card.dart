import 'package:flutter/material.dart';
import 'package:mashcas_turismo/src/models/turismo_model.dart';
import 'package:mashcas_turismo/src/pages/turismo_page.dart';

class TurismoCard extends StatelessWidget {
  const TurismoCard({Key? key, required this.model}) : super(key: key);
  final Turismo model;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      onTap: () {
        Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
              builder: (BuildContext context) => TurismoPage(turismo: model)),
        );
      },
      leading:
          CircleAvatar(backgroundImage: NetworkImage(model.imagen.toString())),
      title: Text(model.nombre ?? ""),
      subtitle: Text(model.descripcion ?? ""),
    ));
  }
}
