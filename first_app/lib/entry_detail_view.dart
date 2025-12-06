// lib/entry_detail_view.dart
import 'package:flutter/material.dart';
import 'models/entry.dart';

class EntryDetailView extends StatelessWidget {
  final Entry entry;

  const EntryDetailView({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(entry.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(entry.description),
            SizedBox(height: 10),
            Text('Lokalizacja: ${entry.location}'),
            SizedBox(height: 10),
            Text('Data: ${entry.date}'),
            if (entry.imageUrl != null) 
              Image.network(entry.imageUrl!),  // Jeśli mamy URL zdjęcia
          ],
        ),
      ),
    );
  }
}
