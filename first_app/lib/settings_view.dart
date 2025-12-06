// lib/settings_view.dart
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ustawienia')),
      body: Center(
        child: SwitchListTile(
          title: Text('Ciemny motyw'),
          value: Theme.of(context).brightness == Brightness.dark,
          onChanged: (value) {
            final theme = value ? ThemeData.dark() : ThemeData.light();
            // Zmiana motywu w całej aplikacji
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => MaterialApp(theme: theme, home: SettingsView()),
              ),
            );
          },
        ),
      ),
    );
  }
}
