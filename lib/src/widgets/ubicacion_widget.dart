import 'package:flutter/material.dart';

class UbiacionWidget extends StatefulWidget {
  const UbiacionWidget({Key? key}) : super(key: key);

  @override
  _UbiacionWidgetState createState() => _UbiacionWidgetState();
}

class _UbiacionWidgetState extends State<UbiacionWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.location_on, size: 50.0),
          Text('Mapa', style: Theme.of(context).textTheme.headline4)
        ],
      ),
    );
  }
}
