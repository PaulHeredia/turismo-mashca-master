import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:mashcas_turismo/src/models/turismo_model.dart';

class TurismoDetailsContentWidget extends StatelessWidget {
  const TurismoDetailsContentWidget({Key? key, required this.turismo})
      : super(key: key);
  final Turismo turismo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 8),
              ExpandText(
                "Descripción: " + turismo.descripcion.toString(),
                maxLines: 5,
                arrowPadding: const EdgeInsets.all(0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
