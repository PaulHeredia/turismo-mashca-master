import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';

class MoreInfoWidget extends StatefulWidget {
  const MoreInfoWidget({Key? key}) : super(key: key);

  @override
  State<MoreInfoWidget> createState() => _MoreInfoWidgetState();
}

class _MoreInfoWidgetState extends State<MoreInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(0.0),
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: const [
              Text(
                "BIENVENIDOS A TURISMO MASHCAS  ",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              ExpandText(
                "Latacunga, también conocida como San Vicente Mártir de Latacunga, es una ciudad ecuatoriana; cabecera cantonal del Cantón Latacunga y capital de la Provincia de Cotopaxi, así como la urbe más grande y poblada de la misma. Se localiza al centro-norte de la Región interandina del Ecuador, en la hoya del río Patate, atravesada por los ríos Cutuchi y Pumacunchi, a una altitud de 2770 m s. n. m. y con un clima frío andino de 13,6 °C en promedio.",
                maxLines: 3,
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ));
  }
}
