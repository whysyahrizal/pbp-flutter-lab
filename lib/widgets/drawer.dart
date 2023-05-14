import 'package:study_tracker/pages/menu.dart';
import 'package:flutter/material.dart';
import 'package:study_tracker/pages/assignment_list.dart';

class StudyTrackerDrawer extends StatelessWidget {
  const StudyTrackerDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
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
            title: Text('Menu Utama'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.assignment),
            title: Text('Daftar Tugas'),
            onTap: () {
              // Route menu ke halaman daftar tugas
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const AssignmentListPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
