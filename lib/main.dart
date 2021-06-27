import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_wahyu/autentikasi/welcome.dart';
import 'package:flutter_application_wahyu/firebase/auhtHelper.dart';
import 'package:flutter_application_wahyu/ui_admin/beranda_admin.dart';
import 'package:flutter_application_wahyu/ui_pelanggan/beranda_customer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: "Kamo-ya App",
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return MyApp();
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: StreamBuilder<User>(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return FutureBuilder<bool>(
              future: AuthHelper().checkUserType(auth.currentUser.uid),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return BerandaCustomer();
                }
                return BerandaAdmin();
              },
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Welcome();
          }
        },
      ),
    );
  }
}
