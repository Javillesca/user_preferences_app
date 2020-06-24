import 'package:flutter/material.dart';

import 'package:userpreferencesapp/src/widgets/menu_widget.dart';
import 'package:userpreferencesapp/src/share_prefs/preferences_user.dart';

class SettingsPage extends StatefulWidget {

  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _secondaryColor;
  int _gender = 1;
  String _name = 'Javier';
  TextEditingController _textController;
  final prefs = new PreferencesUser();
  @override
  void initState() {
    super.initState();
    _gender = prefs.gender;
    _textController = new TextEditingController(text: prefs.name);
    _secondaryColor = prefs.secondaryColor;
    prefs.lastPage = SettingsPage.routeName;
  }

  _setSelectedRadio(int value) {
    prefs.gender = value;
    setState(() => _gender = value );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor: (prefs.secondaryColor) ? Colors.teal : Colors.deepPurple,
      ),
      drawer: MenuWidget(),
      body: Center(
        child: ListView(
          children: <Widget>[

            Container(
              padding: EdgeInsets.all(5.0),
              child: Text('Ajustes', style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold)),
            ),
            Divider(),

            SwitchListTile(
              value: _secondaryColor,
              title: Text('Color secundario'),
              onChanged: (value) {
                setState(() {
                  _secondaryColor = value;
                  prefs.secondaryColor = value;
                });
              }),

            RadioListTile(
                value: 1,
                title: Text('Hombre'),
                groupValue: _gender,
                onChanged: _setSelectedRadio
            ),

            RadioListTile(
                value: 2,
                title: Text('Mujer'),
                groupValue: _gender,
                onChanged: _setSelectedRadio
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Introduzca su nombre de pila'
                ),
                onChanged: ( value ) {
                  prefs.name = value;
                },
              ),
            ),
          ],
        )
      )
    );
  }
}
