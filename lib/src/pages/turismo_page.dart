import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
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
        body: ImageSlideshow(
          width: double.infinity,
          height: 200,
          initialPage: 0,
          indicatorColor: Colors.blue,
          indicatorBackgroundColor: Colors.grey,
          onPageChanged: (value) {
            debugPrint('Page changed: $value');
          },
          autoPlayInterval: 3000,
          isLoop: true,
          children: [
            Image.asset(
              'assets/images/search.jpg',
              fit: BoxFit.cover,
            ),
            Image.asset(
              'assets/images/paisaje.jpg',
              fit: BoxFit.cover,
            ),
            Image.asset(
              'assets/images/caption.jpg',
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );

    /*
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
     */
  }
}
