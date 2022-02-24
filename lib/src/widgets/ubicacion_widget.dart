import 'package:flutter/material.dart';
import 'package:mashcas_turismo/src/models/turismo_model.dart';

import 'package:mashcas_turismo/src/pages/location_page.dart';
import 'package:mashcas_turismo/src/utils/main_menu.dart';

class UbiacionWidget extends StatefulWidget {
  const UbiacionWidget({Key? key}) : super(key: key);

  @override
  _UbiacionWidgetState createState() => _UbiacionWidgetState();
}

class _UbiacionWidgetState extends State<UbiacionWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User location application',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        backgroundColor: Colors.cyan,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on,
                size: 45.0,
                color: Colors.white,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Ubicación",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              SizedBox(
                height: 05.0,
              ),
              // button for taking the location
              // ignore: deprecated_member_use
              FlatButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LocationPage()),
                  );
                },
                child: Text("¿Cómo llegar?"),
              )
            ],
          ),
        ),
      ),
    );
    /*
    
    return Center(
      // ignore: deprecated_member_use
      child: RaisedButton(
        child: Text('Mostrar ubicacion'),
        onPressed: () {
          getCurrentLocation();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LocationPage()),
          );
        },
      ),
    );
     */
  }
}
