import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScaffoldMessenger(child: MyHomePage()),
    );
  }
}

class Assignment {
  final String name;
  final String subject;
  final int progress;
  final DateTime date;
  final String description;

  Assignment({
    required this.name,
    required this.subject,
    required this.progress,
    required this.date,
    required this.description,
  });

  factory Assignment.fromJson(Map<String, dynamic> json) {
    return Assignment(
      name: json['name'],
      subject: json['subject'],
      progress: json['progress'],
      date: DateTime.parse(json['date']),
      description: json['description'],
    );
  }
}


class MyHomePage extends StatelessWidget {
  void showSnackBar(BuildContext context, String content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Study Tracker'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Menu'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Tambah Tugas'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => FormPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: () => showSnackBar(
                  context, 'Kamu telah menekan tombol Lihat Study Tracker'),
              icon: Icon(Icons.view_list),
              label: Text('Lihat Study Tracker'),
            ),
            SizedBox(height: 20), // Jarak antara tombol
            ElevatedButton.icon(
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => FormPage()),
              ),
              icon: Icon(Icons.add),
              label: Text('Tambah Tugas'),
            ),
            SizedBox(height: 20), // Jarak antara tombol
            ElevatedButton.icon(
              onPressed: () =>
                  showSnackBar(context, 'Kamu telah menekan tombol Logout'),
              icon: Icon(Icons.exit_to_app),
              label: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final taskNameController = TextEditingController();
  final courseNameController = TextEditingController();
  final progressController = TextEditingController();
  final taskDescriptionController = TextEditingController();

  @override
  void dispose() {
    taskNameController.dispose();
    courseNameController.dispose();
    progressController.dispose();
    taskDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Tugas'),
          leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
            );
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: taskNameController,
              decoration: const InputDecoration(
                hintText: 'Masukkan nama tugas',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Masukkan nama tugas';
                }
                return null;
              },
            ),
            TextFormField(
              controller: courseNameController,
              decoration: const InputDecoration(
                hintText: 'Masukkan nama mata kuliah',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Masukkan nama mata kuliah';
                }
                return null;
              },
            ),
            TextFormField(
              controller: progressController,
              decoration: const InputDecoration(
                hintText: 'Masukkan persentase progress',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Masukkan persentase progress';
                }
                return null;
              },
            ),
            TextFormField(
              controller: taskDescriptionController,
              decoration: const InputDecoration(
                hintText: 'Masukkan deskripsi tugas',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Masukkan deskripsi tugas';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Informasi Tugas'),
                          content: Text(
                            'Nama Tugas: ${taskNameController.text}\n'
                            'Nama Mata Kuliah: ${courseNameController.text}\n'
                            'Persentase Progress: ${progressController.text}\n'
                            'Deskripsi Tugas: ${taskDescriptionController.text}',
                          ),
                          actions: [
                            TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text('Tambah'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

             
