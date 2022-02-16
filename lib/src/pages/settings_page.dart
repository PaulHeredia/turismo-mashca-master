import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mashcas_turismo/src/providers/main_providers.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    Map<String, dynamic> content = JwtDecoder.decode(mainProvider.token);

    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Card(
                child: ListTile(
                    trailing: IconButton(
                        onPressed: () {
                          mainProvider.token = "";
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.logout)),
                    leading: const Icon(Icons.person),
                    title: Text(content["name"]),
                    subtitle: const Text("Nombre"))),
            Card(
                child: ListTile(
                    leading: const Icon(Icons.important_devices),
                    title: Text(content["user_id"]),
                    subtitle: const Text("Id"))),
            Card(
                child: ListTile(
                    leading: const Icon(Icons.email),
                    title: Text(content["email"]),
                    subtitle: const Text("Correo electrónico"))),
            const SettingMode()
          ],
        ),
      ),
    ));
  }
}

class SettingMode extends StatelessWidget {
  const SettingMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 0,
        ),
        ExpansionTile(
          leading: const Icon(Icons.settings),
          title: const Text("Configuración"),
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.brightness_4_outlined),
              title: const Text('Modo Oscuro'),
              trailing: Switch(
                value: !mainProvider.mode,
                onChanged: (bool value) async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setBool("mode", !value);
                  mainProvider.mode = !value;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
