import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();

  FirebaseAuth auth = FirebaseAuth.instance;

  final email = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'Masukkan Email dan Password Anda!',
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
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    auth
                        .signInWithEmailAndPassword(
                            email: email.text.toString(),
                            password: password.text.toString())
                        .then((value) {
                      Navigator.pop(context);
                    });
                  }
                },
                child: Text('LOGIN'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
