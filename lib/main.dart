import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mashcas_turismo/src/pages/home_page.dart';
import 'package:mashcas_turismo/src/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => AppTheme(ThemeData.light()),
        child: MaterialAppWithTheme());
  }
}

// ignore: use_key_in_widget_constructors
class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<AppTheme>(context);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme.getTheme(),
        home: const HomePage(),
      ),
    );
    //return MaterialApp(theme: theme.getTheme(), home: const HomePage());
  }
}
