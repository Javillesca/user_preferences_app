import 'package:flutter/material.dart';

import 'package:userpreferencesapp/src/pages/home_page.dart';
import 'package:userpreferencesapp/src/pages/settings_page.dart';
import 'package:userpreferencesapp/src/share_prefs/preferences_user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferencesUser();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final prefs = new PreferencesUser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias',
      initialRoute: prefs.lastPage,
      routes: {
        HomePage.routeName : (BuildContext context ) => HomePage(),
        SettingsPage.routeName : (BuildContext context ) => SettingsPage(),
      },
    );
  }
}
