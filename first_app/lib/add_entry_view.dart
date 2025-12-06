// lib/add_entry_view.dart
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'models/entry.dart';

class AddEntryView extends StatefulWidget {
  const AddEntryView({super.key});

  @override
  _AddEntryViewState createState() => _AddEntryViewState();
}

class _AddEntryViewState extends State<AddEntryView> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  String? _location;
  String? _imageUrl;

  // Funkcja do pobierania lokalizacji
  void _getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      _location = '${position.latitude}, ${position.longitude}';
    });
  }

  // Funkcja do robienia zdjęcia
  void _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _imageUrl = pickedFile.path;  // Zapisz ścieżkę do zdjęcia
      });
    }
  }

  // Funkcja do zapisania wpisu
  void _saveEntry() {
    final entry = Entry(
      id: 'new_id',  // Możesz generować ID na serwerze
      title: _titleController.text,
      description: _descriptionController.text,
      location: _location ?? 'Brak lokalizacji',
      imageUrl: _imageUrl,
      date: DateTime.now(),
    );

    // Tutaj dodajemy kod do wysłania wpisu na serwer (np. przy pomocy API)
    Navigator.pop(context);  // Powrót do poprzedniego ekranu
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dodaj wpis')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Tytuł'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Opis'),
            ),
            ElevatedButton(
              onPressed: _getLocation,
              child: Text('Pobierz lokalizację'),
            ),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Zrób zdjęcie'),
            ),
            ElevatedButton(
              onPressed: _saveEntry,
              child: Text('Zapisz wpis'),
            ),
          ],
        ),
      ),
    );
  }
}
