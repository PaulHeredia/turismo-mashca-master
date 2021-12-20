import 'package:flutter/material.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({Key? key}) : super(key: key);

  @override
  _LocationWidgetState createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blueAccent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Latacunga.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: null /* add child content here */,
        /*child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/bienvenida.jpeg",
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                  ),
                )
              ],
            )
          ],
        ),*/
      ),
    );
  }
}
