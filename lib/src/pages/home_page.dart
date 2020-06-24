import 'package:flutter/material.dart';
import 'package:userpreferencesapp/src/widgets/menu_widget.dart';
import 'package:userpreferencesapp/src/share_prefs/preferences_user.dart';

class HomePage extends StatelessWidget {

  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    final prefs = new PreferencesUser();
    prefs.lastPage = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
        backgroundColor: (prefs.secondaryColor) ? Colors.teal : Colors.deepPurple,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color segundario: ${ prefs.secondaryColor }'),
          Divider(),
          Text('Género: ${ prefs.gender }'),
          Divider(),
          Text('Nombre de usuario: ${ prefs.name }'),
          Divider()
        ],
      ),
    );
  }
}
