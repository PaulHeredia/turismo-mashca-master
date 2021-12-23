import 'package:flutter/material.dart';
import 'package:mashcas_turismo/src/pages/home_page.dart';
import 'package:mashcas_turismo/src/providers/Theme_providers.dart';
import 'package:mashcas_turismo/src/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(SettingPageTM());
}

class SettingPageTM extends StatefulWidget {
  @override
  _SettingPageTMState createState() => _SettingPageTMState();
}

class _SettingPageTMState extends State<SettingPageTM> {
  ThemeProvider themeChangeProvider = new ThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.setTheme =
        await themeChangeProvider.themePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: themeChangeProvider,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Theming',
        home: SettingPage(),
      ),
    );
  }
}

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor:
          currentTheme.isDarkTheme() ? const Color(0xff2a293d) : Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Toca para cambiar el tema',
              style: TextStyle(
                color: currentTheme.isDarkTheme() ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Icon(Icons.wb_sunny,
                    color: currentTheme.isDarkTheme()
                        ? Colors.white
                        : Colors.black),
                Switch(
                    value: currentTheme.isDarkTheme(),
                    onChanged: (value) {
                      String newTheme =
                          value ? ThemePreference.DARK : ThemePreference.LIGHT;
                      currentTheme.setTheme = newTheme;
                    }),
                Icon(Icons.brightness_2,
                    color: currentTheme.isDarkTheme()
                        ? Colors.white
                        : Colors.black)
              ],
            )
          ],
        ),
      ),
    );
  }
}
