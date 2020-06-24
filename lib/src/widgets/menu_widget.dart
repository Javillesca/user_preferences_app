import 'package:flutter/material.dart';

import 'package:userpreferencesapp/src/pages/home_page.dart';
import 'package:userpreferencesapp/src/pages/settings_page.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              child: Container(),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/cyber-background.jpg'),
                      fit: BoxFit.cover
                  )
              )
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.deepPurpleAccent),
            title: Text('Inicio'),
            onTap: () => Navigator.pushReplacementNamed(context, HomePage.routeName),
          ),
          ListTile(
            leading: Icon(Icons.new_releases, color: Colors.deepPurple),
            title: Text('Novedades'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.favorite, color: Colors.purple),
            title: Text('Favoritos'),
            onTap: (){},
          ),
          ListTile(
              leading: Icon(Icons.settings, color: Colors.purpleAccent),
              title: Text('Ajustes'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, SettingsPage.routeName);
              }
          ),
        ],
      ),
    );
  }
}
