/*
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mashcas_turismo/src/models/turismo_model.dart';

class ExperienciaFirebaseWidget extends StatefulWidget {
 const ExperienciaFirebaseWidget({Key? key}) : super(key: key);

  @override
   ExperienciaFirebaseWidgetState createState() =>  ExperienciaFirebaseWidgetState();
}

class ExperienciaFirebaseWidgetState extends State <ExperienciaFirebaseWidget> {
  final Stream<QuerySnapshot> _turismoRef =
      FirebaseFirestore.instance.collection('palces').snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _turismoRef,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text("Un error ha ocurrido"));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: SizedBox.square(
                  dimension: 50.0, child: CircularProgressIndicator()));
        }

       
      },
    );
  }
}

*/