import 'package:flutter/material.dart';
import 'package:mashcas_turismo/src/models/turismo_model.dart';
import 'package:mashcas_turismo/src/services/turismo_service.dart';
import 'package:mashcas_turismo/src/widgets/turismo_card.dart';

class TurismoWidget extends StatefulWidget {
  const TurismoWidget({Key? key}) : super(key: key);

  @override
  State<TurismoWidget> createState() => _MantenimientosWidgetState();
}

class _MantenimientosWidgetState extends State<TurismoWidget> {
  final TurismoService _turismoService = TurismoService();
  List<Turismo>? _listaTurismo;

  @override
  void initState() {
    super.initState();
    _downloadMantenimientos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _listaTurismo == null
            ? const Center(
                child: SizedBox.square(
                    dimension: 50.0, child: CircularProgressIndicator()))
            : _listaTurismo!.isEmpty
                ? const Center(child: Text("No hay Lugares"))
                : ListView(
                    children: _listaTurismo!
                        .map((e) => TurismoCard(model: e))
                        .toList(),
                  ));
  }

  _downloadMantenimientos() async {
    _listaTurismo = await _turismoService.getMantenimientos();
    if (mounted) {
      setState(() {});
    }
  }
}
