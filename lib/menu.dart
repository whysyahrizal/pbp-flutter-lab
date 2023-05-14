import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:study_tracker/pages/login.dart';
import 'package:study_tracker/pages/assignment_list.dart';
import 'package:study_tracker/pages/form_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Study Tracker',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'Selamat datang!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                shrinkWrap: true,
                children: <Widget>[
                  Material(
                    color: Colors.blue,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => AssignmentListPage()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.view_list,
                                color: Colors.white,
                                size: 30.0,
                              ),
                              Padding(padding: EdgeInsets.all(3)),
                              Text(
                                "Lihat Daftar Tugas",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.blue,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MyFormPage()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.add_box,
                                color: Colors.white,
                                size: 40.0,
                              ),
                              Padding(padding: EdgeInsets.all(1)),
                              Text(
                                "Tambah Tugas",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.blue,
                    child: InkWell(
                      onTap: () async {
                        final response = await request.logout(
                            "https://web-production-fe86a.up.railway.app/auth/logout/");
                        String message = response["message"];
                        if (response['status']) {
                          String uname = response["username"];
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("$message Sampai jumpa, $uname."),
                          ));
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("$message"),
                          ));
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                                                child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.exit_to_app,
                                color: Colors.white,
                                size: 30.0,
                              ),
                              Padding(padding: EdgeInsets.all(3)),
                              Text(
                                "Logout",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

                       
