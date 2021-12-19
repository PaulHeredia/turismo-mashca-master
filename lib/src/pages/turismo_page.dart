import 'package:flutter/material.dart';
import 'package:mashcas_turismo/src/models/turismo_model.dart';

class TurismoPage extends StatelessWidget {
  const TurismoPage({Key? key, required this.turismo}) : super(key: key);
  final Turismo turismo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(turismo.nombre ?? "")),
      body: Column(
        children: const [Center(), Text("Lugares Representativos")],
      ),
    );
  }
}
