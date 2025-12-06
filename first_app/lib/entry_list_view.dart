// lib/entry_list_view.dart
import 'package:flutter/material.dart';
import 'models/entry.dart';
import 'entry_detail_view.dart';  // Import widoku szczegółów wpisu

class EntryListView extends StatelessWidget {
  final List<Entry> entries;  // Lista wpisów

  const EntryListView({super.key, required this.entries});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wpisy')),
      body: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          final entry = entries[index];
          return ListTile(
            title: Text(entry.title),
            subtitle: Text('Lokalizacja: ${entry.location}, Data: ${entry.date}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EntryDetailView(entry: entry),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
