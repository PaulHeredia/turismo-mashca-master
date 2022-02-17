import 'package:flutter/material.dart';
import 'package:mashcas_turismo/src/models/turismo_model.dart';
import 'package:mashcas_turismo/src/pages/turismo_page.dart';

class TurismoCard extends StatelessWidget {
  const TurismoCard({Key? key, required this.model}) : super(key: key);
  final Turismo model;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: const EdgeInsets.all(8.0),
        child: InkWell(
            onTap: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        TurismoPage(turismo: model)),
              );
            },
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Column(
                  children: <Widget>[
                    Expanded(
                        child: Image.network(model.imagen ?? "",
                            fit: BoxFit.cover)),
                    Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          model.nombre ?? "",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
                          textAlign: TextAlign.center,
                        ))
                  ],
                ))));
  }
}
