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
              Expanded(
                child: Column(
                  children: [
                    RatingBar.builder(
                      initialRating: turismo.calificacion! / 2,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    Text(
                      "Calificacion: " +
                          (turismo.calificacion! / 2).toStringAsFixed(1),
                      style: TextStyle(
                          color: Colors.amber, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
