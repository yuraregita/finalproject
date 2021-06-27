import 'package:flutter/material.dart';
import 'package:flutter_application_wahyu/firebase/auhtHelper.dart';
import 'package:flutter_application_wahyu/helper/dbhelper.dart';

class SignUp extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  final email = TextEditingController();
  final password = TextEditingController();

  final dbHelper = DbHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'Masukkan data-data berikut!',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      color: Colors.grey,
                      padding: EdgeInsets.all(10),
                      height: 50,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Email',
                        ),
                        controller: email,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Tolong masukkan email anda!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      color: Colors.grey,
                      padding: EdgeInsets.all(10),
                      height: 50,
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                        ),
                        controller: password,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Tolong masukkan password anda!';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.greenAccent,
                  minimumSize: Size(double.infinity, 50),
                ),
                onPressed: () async {
                  if (formKey.currentState.validate()) {
                    bool isDone = await AuthHelper().signUp(
                        email.text.toString(), password.text.toString());
                    if (isDone) {
                      Navigator.pop(context);
                    }
                  }
                },
                child: Text('SIGN-UP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
