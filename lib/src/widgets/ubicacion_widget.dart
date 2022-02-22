import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mashcas_turismo/src/models/turismo_model.dart';

class UbiacionWidget extends StatefulWidget {
  const UbiacionWidget({Key? key}) : super(key: key);

  @override
  _UbiacionWidgetState createState() => _UbiacionWidgetState();
}

class _UbiacionWidgetState extends State<UbiacionWidget> {
  final Completer<GoogleMapController> _controller = Completer();

  final CameraPosition _kLatacunga = const CameraPosition(
    target: LatLng(-0.9333, -78.6185),
    zoom: 14,
  );

  final Stream<QuerySnapshot> _mantenimientoStrem =
      FirebaseFirestore.instance.collection('places').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _mantenimientoStrem,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: SizedBox(child: Text('Error al consultar el Lugar.')),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: SizedBox(
                  height: 50.0,
                  width: 50.0,
                  child: CircularProgressIndicator()),
            );
          }

          if (snapshot.hasData) {
            Set<Marker> kMnts =
                snapshot.data!.docs.map((DocumentSnapshot document) {
              Turismo model =
                  Turismo.fromJson(document.data() as Map<String, dynamic>);

              Marker marker = Marker(
                  infoWindow: InfoWindow(title: model.nombre),
                  markerId: MarkerId(model.nombre ?? ""),
                  position: LatLng(
                      model.latitud ?? -0.9333, model.longitud ?? -78.6185));

              return marker;
            }).toSet();

            return GoogleMap(
              markers: kMnts,
              mapType: MapType.terrain,
              initialCameraPosition: _kLatacunga,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            );
          }

          return const SizedBox();
        });
  }
}
