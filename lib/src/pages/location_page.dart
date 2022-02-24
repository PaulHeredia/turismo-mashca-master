import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mashcas_turismo/src/models/turismo_model.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);
  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  var locationMessage = '';
  String latitude = "";
  String longitude = "";
  double lat = 0.0;
  double long = 0.0;
  // función para obtener la ubicación actual
  // pero antes hay que añadir este permiso
  void getCurrentLocation() async {
    final Completer<GoogleMapController> _controller = Completer();
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    lat = position.latitude;
    long = position.longitude;

    // pasando esto a las cadenas de latitud y longitud
    latitude = "$lat";
    longitude = "$long";

    setState(() {
      locationMessage = "Latitude: $lat and Longitude: $long";
    });
  }

  final CameraPosition _kLatacunga = const CameraPosition(
    target: LatLng(-0.9333, -78.6185),
    zoom: 14,
  );
  final Stream<QuerySnapshot> _turismoStrem =
      FirebaseFirestore.instance.collection('places').snapshots();
  late GoogleMapController _googleMapController;

  @override
  void dispose() {
    getCurrentLocation();
    print("" + latitude + "" + longitude);
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ruta - Maps"),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kLatacunga,
        onMapCreated: (controller) => _googleMapController = controller,
      ),
    );
    /*
    return StreamBuilder<QuerySnapshot>(
        stream: _turismoStrem,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: SizedBox(child: Text('Error al consultar los Lugares.')),
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
                  markerId: MarkerId(model.descripcion ?? ""),
                  position:
                      LatLng(model.lat ?? -0.9333, model.lng ?? -78.4710141));

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
     */
  }
}
/*
class LocationPage extends StatefulWidget {
  const LocationPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}


class _LocationPageState extends State<LocationPage> {
  final Completer<GoogleMapController> _controller = Completer();

  CameraPosition _kLatacunga = const CameraPosition(
    target: LatLng(-0.6166452, -78.4754215),
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
              child: SizedBox(child: Text('Error al consultar los Lugares.')),
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
                  markerId: MarkerId(model.descripcion ?? ""),
                  position:
                      LatLng(model.lat ?? -0.9333, model.lng ?? -78.4710141));

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


 */
