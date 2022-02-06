import 'package:flutter/material.dart';
import 'package:mashcas_turismo/src/models/turismo_model.dart';
import 'package:mashcas_turismo/src/widgets/account_windget.dart';
import 'package:mashcas_turismo/src/widgets/experiencia_form_widget.dart';
import 'package:mashcas_turismo/src/widgets/location_widget.dart';
import 'package:mashcas_turismo/src/widgets/turismo_widget.dart';

late Turismo turismo;

class ItemMenu {
  String title;
  IconData icon;
  ItemMenu(this.icon, this.title);
}

List<ItemMenu> menuOptions = [
  ItemMenu(Icons.home_filled, "Inicio"),
  ItemMenu(Icons.search, "Explorar"),
  ItemMenu(Icons.forum, "Experiencia"),
  ItemMenu(Icons.account_box, "Mi cuenta"),
];

List<Widget> homeWidgets = [
  const LocationWidget(),
  const TurismoWidget(),
  const ExperienciaFormWidget(isInicio: false, nombre_lugar: ""),
  const AccountWidget()
];
