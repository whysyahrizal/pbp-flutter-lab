import 'package:flutter/material.dart';

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
              onPressed: () => showSnackBar(
                  context, 'Kamu telah menekan tombol Tambah Tugas'),
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
