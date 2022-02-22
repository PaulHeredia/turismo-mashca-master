import 'package:flutter/material.dart';
import 'package:mashcas_turismo/src/models/turismo_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mashcas_turismo/src/widgets/turismo_details_widget.dart';

class TurismoPage extends StatelessWidget {
  const TurismoPage({Key? key, required this.turismo}) : super(key: key);
  final Turismo turismo;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              expandedHeight: 150.h,
              flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    turismo.nombre ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  background:
                      Image.network(turismo.imagen ?? "", fit: BoxFit.cover)),
            ),
            SliverFillRemaining(
              child: TurismoDetailsWidget(turismo: turismo),
            ),
          ],
        ),
      ),
    );
  }
}
