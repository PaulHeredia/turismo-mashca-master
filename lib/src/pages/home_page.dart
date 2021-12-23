import 'package:flutter/material.dart';
import 'package:mashcas_turismo/src/theme/app_theme.dart';
import 'package:mashcas_turismo/src/utils/main_menu.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<String> _options = [
    "Inicio",
    "Explorar",
    "Favoritos",
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<AppTheme>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(_options[_selectedIndex]),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  child: Column(
                children: [
                  Expanded(child: Image.asset('assets/images/config.png')),
                  const Text('Configuracion Tema'),
                  const SizedBox(
                    height: 10.0,
                  )
                ],
              )), //Padding(padding: )
              const Text('Elija el Tema de preferencia'),
              ListaBotones()
            ],
          ),
        ),
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

// ignore: use_key_in_widget_constructors
class ListaBotones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<AppTheme>(context);
    return Column(
      children: [
        FlatButton(
            onPressed: () => theme.setTheme(ThemeData.light()),
            child: const Text('Claro')),
        FlatButton(
          child: const Text('Oscuro'),
          onPressed: () => theme.setTheme(ThemeData.dark()),
        )
      ],
    );
  }
}

// ignore: unused_element
class _BarraLateral extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<AppTheme>(context);
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text('Configuración'),
                  ),
                  ListaBotones(),
                ],
              ),
            )));
  }
}
