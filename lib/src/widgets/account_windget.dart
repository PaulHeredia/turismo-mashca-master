import 'package:flutter/material.dart';

import 'package:mashcas_turismo/src/providers/main_providers.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountWidget extends StatefulWidget {
  const AccountWidget({Key? key}) : super(key: key);

  @override
  State<AccountWidget> createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context, listen: true);
    // Map<String, dynamic> content = JwtDecoder.decode(mainProvider.token);
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 60,
        ),
        ExpansionTile(
          leading: const Icon(Icons.settings),
          title: const Text("Configuración Tema"),
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.brightness_4_outlined),
              title: const Text('Oscuro/Claro'),
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
