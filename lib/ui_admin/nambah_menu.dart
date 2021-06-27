import 'package:flutter/material.dart';
import 'package:flutter_application_wahyu/helper/dbhelper.dart';
import 'package:flutter_application_wahyu/models/menu.dart';

class NambahMenu extends StatefulWidget {
  @override
  _NambahMenuState createState() => _NambahMenuState();
}

class _NambahMenuState extends State<NambahMenu> {
  String nama;
  String desc;
  String harga;
  String gambar;
  String star;

  bool statusLoading = false;

  final dbHelper = DbHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Menu'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          child: Column(
            children: [
              Container(
                height: 50,
                padding: EdgeInsets.all(10),
                color: Colors.grey,
                child: TextFormField(
                  initialValue: nama,
                  decoration: InputDecoration(
                    hintText: 'Nama',
                  ),
                  onChanged: (value) {
                    setState(() {
                      nama = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 50,
                padding: EdgeInsets.all(10),
                color: Colors.grey,
                child: TextFormField(
                  initialValue: desc,
                  decoration: InputDecoration(
                    hintText: 'Desc',
                  ),
                  onChanged: (value) {
                    setState(() {
                      desc = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 50,
                padding: EdgeInsets.all(10),
                color: Colors.grey,
                child: TextFormField(
                  initialValue: harga,
                  decoration: InputDecoration(
                    hintText: 'Harga',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      harga = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 50,
                padding: EdgeInsets.all(10),
                color: Colors.grey,
                child: TextFormField(
                  initialValue: star,
                  decoration: InputDecoration(
                    hintText: 'Bintang, skala 1 sampai 5',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      star = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 70,
                padding: EdgeInsets.all(10),
                color: Colors.grey,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'URL Gambar',
                  ),
                  onChanged: (value) {
                    setState(() {
                      gambar = value;
                    });
                    print(gambar);
                  },
                ),
              ),
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                  minimumSize: Size(
                    double.infinity,
                    50,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    statusLoading = !statusLoading;
                  });
                  dbHelper
                      .insertMenu(Menu(nama, desc, harga, gambar, star))
                      .then(
                    (value) {
                      setState(() {
                        statusLoading = !statusLoading;
                      });
                      Navigator.pop(context);
                    },
                  );
                },
                child: statusLoading
                    ? CircularProgressIndicator()
                    : Text('TAMBAH'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
