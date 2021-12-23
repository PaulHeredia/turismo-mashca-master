import 'package:flutter/material.dart';
import 'package:mashcas_turismo/src/models/turismo_model.dart';

class TurismoPage extends StatelessWidget {
  const TurismoPage({Key? key, required this.turismo}) : super(key: key);
  final Turismo turismo;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(turismo.nombre ?? ""),
        ),
        body: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Información " + turismo.nombre.toString(),
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                "Descripcion: " + turismo.descripcion.toString(),
                style: const TextStyle(fontSize: 15),
              ),
              Text(
                "Longitud: " + turismo.longitud.toString(),
                style: const TextStyle(fontSize: 15),
              ),
              Text(
                "Latitud: " + turismo.longitud.toString(),
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
          CircleAvatar(backgroundImage: NetworkImage(turismo.imagen!)),
        ]),
      ),
    );
  }
}
