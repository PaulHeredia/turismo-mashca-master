import 'package:flutter/material.dart';
import 'package:mashcas_turismo/src/models/turismo_model.dart';
import 'package:mashcas_turismo/src/widgets/turismo_details_content_widget.dart';
import 'package:mashcas_turismo/src/widgets/ubicacion_widget.dart';

class TurismoDetailsWidget extends StatefulWidget {
  const TurismoDetailsWidget({Key? key, required this.turismo})
      : super(key: key);
  final Turismo turismo;

  @override
  _NovelaDetailsWidgetState createState() => _NovelaDetailsWidgetState();
}

class _NovelaDetailsWidgetState extends State<TurismoDetailsWidget>
    with SingleTickerProviderStateMixin {
  final List<Tab> _tabs = <Tab>[
    const Tab(text: "Detalles"),
    const Tab(text: "Ubicacion"),
  ];

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TabBar(tabs: _tabs, controller: _tabController),
        body: TabBarView(children: [
          TurismoDetailsContentWidget(turismo: widget.turismo),
          const UbiacionWidget()
        ], controller: _tabController));
  }
}
