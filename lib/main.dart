import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mashcas_turismo/src/pages/home_page.dart';
import 'package:mashcas_turismo/src/providers/main_providers.dart';

import 'package:mashcas_turismo/src/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => MainProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context, listen: true);
    return FutureBuilder<bool>(
        future: mainProvider.initPrefs(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const SizedBox.square(
                dimension: 150.0, child: Text("Ha ocurrido un error"));
          }

          if (snapshot.hasData) {
            return ScreenUtilInit(
              designSize: const Size(360, 690),
              builder: () => MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: AppTheme.themeData(mainProvider.mode),
                routes: {
                  "/home": (context) => const HomePage(),
                  // "/login": (context) => const LoginPage(),
                  // "/signup": (context) => const SignUpPage()
                },
                home: mainProvider.token == ""
                    ? const HomePage()
                    //? const LoginPage()
                    : const HomePage(),
              ),
            );
          }

          return const SizedBox.square(
              dimension: 50.0, child: CircularProgressIndicator());
        });
  }
}
