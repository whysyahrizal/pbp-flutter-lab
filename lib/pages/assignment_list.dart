import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:study_tracker/model/assignment_record.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class AssignmentListPage extends StatefulWidget {
  const AssignmentListPage({Key? key}) : super(key: key);

  @override
  _AssignmentListPageState createState() => _AssignmentListPageState();
}

class _AssignmentListPageState extends State<AssignmentListPage> {
  Future<List<AssignmentRecord>> fetchAssignmentRecord() async {
    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    var url = Uri.parse('https://<URL_APP_KAMU>/tracker/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object AssignmentRecord
    List<AssignmentRecord> listAssignmentRecord = [];
    for (var d in data) {
      if (d != null) {
        listAssignmentRecord.add(AssignmentRecord.fromJson(d));
      }
    }
    return listAssignmentRecord;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Daftar Tugas'),
        ),
        drawer: const StudyTrackerDrawer(),
        body: FutureBuilder(
            future: fetchAssignmentRecord(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada data tugas.",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.blueAccent, blurRadius: 2.0)
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${snapshot.data![index].fields.subject}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                    "${snapshot.data![index].fields.assignmentName}"),
                              ],
                            ),
                          ));
                }
              }
            }));
  }
}
