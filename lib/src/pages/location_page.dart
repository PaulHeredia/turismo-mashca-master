import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mashcas_turismo/src/models/turismo_model.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final Completer<GoogleMapController> _controller = Completer();
  var locationMessage = '';
  String latitude = "";
  String longitude = "";
  var position;
  // función para obtener la ubicación actual
  // pero antes hay que añadir este permiso
  void getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    var lat = position.latitude;
    var long = position.longitude;
    // passing this to latitude and longitude strings
    latitude = "$lat";
    longitude = "$long";

    setState(() {
      locationMessage = "Latitude: $lat and Longitude: $long";
    });
  }

  CameraPosition _kLatacunga = const CameraPosition(
    tilt: 59.440717697143555,
    bearing: 192.8334901395799,
    target: LatLng(-0.9306044, -78.6266061),
    zoom: 14,
  );

  final Stream<QuerySnapshot> _turismoStrem =
      FirebaseFirestore.instance.collection('places').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ruta - Maps"),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _turismoStrem,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                    position: LatLng(
                        model.lat ?? -0.9328069, model.lng ?? -78.6243278));

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
          }),
      floatingActionButton: FloatingActionButton(
          highlightElevation: 500,
          child: const Icon(Icons.location_on),
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.black,
          onPressed: () {
            getCurrentLocation();
            print("latitud: " + latitude);
          }),
    );
  }
}
