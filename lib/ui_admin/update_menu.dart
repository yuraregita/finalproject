import 'package:flutter/material.dart';
import 'package:flutter_application_wahyu/helper/dbhelper.dart';
import 'package:flutter_application_wahyu/models/menu.dart';

class UpdateMenu extends StatefulWidget {
  final Menu menu;

  UpdateMenu(this.menu);

  @override
  _UpdateMenuState createState() => _UpdateMenuState();
}

class _UpdateMenuState extends State<UpdateMenu> {
  bool statusLoading = false;

  final dbHelper = DbHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Update Menu'),
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
                  initialValue: widget.menu.nama,
                  decoration: InputDecoration(
                    hintText: 'Nama',
                  ),
                  onChanged: (value) {
                    setState(() {
                      widget.menu.nama = value;
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
                  initialValue: widget.menu.desc,
                  decoration: InputDecoration(
                    hintText: 'Desc',
                  ),
                  onChanged: (value) {
                    setState(() {
                      widget.menu.desc = value;
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
                  initialValue: widget.menu.harga,
                  decoration: InputDecoration(
                    hintText: 'Harga',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      widget.menu.harga = value;
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
                  initialValue: widget.menu.star,
                  decoration: InputDecoration(
                    hintText: 'Bintang, skala 1 sampai 5',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      widget.menu.star = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 70,
                padding: EdgeInsets.all(10),
                color: Colors.grey,
                child: TextFormField(
                  initialValue: widget.menu.gambar,
                  decoration: InputDecoration(
                    hintText: 'URL Gambar',
                  ),
                  onChanged: (value) {
                    setState(() {
                      widget.menu.gambar = value;
                    });
                  },
                ),
              ),
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent,
                  minimumSize: Size(
                    double.infinity,
                    50,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    statusLoading = !statusLoading;
                  });
                  dbHelper.deleteMenu(widget.menu.id).then(
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
                    : Text('DELETE'),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellowAccent,
                  minimumSize: Size(
                    double.infinity,
                    50,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    statusLoading = !statusLoading;
                  });
                  dbHelper.updateMenu(widget.menu).then((value) {
                    setState(() {
                      statusLoading = !statusLoading;
                    });
                    Navigator.pop(context);
                  });
                },
                child: statusLoading
                    ? CircularProgressIndicator()
                    : Text('UPDATE'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
