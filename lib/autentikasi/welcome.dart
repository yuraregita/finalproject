import 'package:flutter/material.dart';
import 'package:flutter_application_wahyu/autentikasi/login.dart';
import 'package:flutter_application_wahyu/autentikasi/signup.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 200,
                  child: Image.asset('assets/appimage/kamoya.jpeg'),
                ),
                Text(
                  'SELAMAT DATANG DI KAMO-YA',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.greenAccent,
                        minimumSize: Size(double.infinity, 50),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (builder) {
                              return Login();
                            },
                          ),
                        );
                      },
                      child: Text('LOGIN'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey,
                        minimumSize: Size(double.infinity, 50),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (builder) {
                              return SignUp();
                            },
                          ),
                        );
                      },
                      child: Text('SIGN-UP'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
