import 'package:flutter/material.dart';
import 'package:mashcas_turismo/src/utils/main_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<String> _options = ["Inicio", "Explorar", "Favoritos"];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:
            AppBar(centerTitle: true, title: Text(_options[_selectedIndex])),
        body: homeWidgets[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            _selectedIndex = index;
            setState(() {});
          },
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          items: menuOptions
              .map((e) =>
                  BottomNavigationBarItem(icon: Icon(e.icon), label: e.title))
              .toList(),
        ),
      ),
    );
  }
}
