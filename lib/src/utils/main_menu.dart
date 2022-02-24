import 'package:flutter/material.dart';

import 'package:mashcas_turismo/src/pages/settings_page.dart';
import 'package:mashcas_turismo/src/widgets/experiencia_form_widget.dart';
import 'package:mashcas_turismo/src/widgets/location_widget.dart';
import 'package:mashcas_turismo/src/widgets/turismo_widget.dart';
import 'package:mashcas_turismo/src/widgets/story_image.dart';

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
  ItemMenu(Icons.web_stories, "Descubre"),
];

List<Widget> homeWidgets = [
  const LocationWidget(),
  const TurismoWidget(),
  const ExperienciaFormWidget(isInicio: false, nombre_lugar: ""),
  const SettingsPage(),
  const Location1Widget()
];
