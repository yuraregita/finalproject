import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_wahyu/helper/dbhelper.dart';
import 'package:flutter_application_wahyu/models/menu.dart';
import 'package:flutter_application_wahyu/ui_admin/nambah_menu.dart';
import 'package:flutter_application_wahyu/ui_admin/update_menu.dart';

class BerandaAdmin extends StatefulWidget {
  @override
  _BerandaAdminState createState() => _BerandaAdminState();
}

class _BerandaAdminState extends State<BerandaAdmin> {
  final dbHelper = DbHelper();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (builder) {
                return NambahMenu();
              },
            ),
          );
        },
      ),
      appBar: AppBar(
        title: Text('ADMIN'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              auth.signOut();
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: StreamBuilder<List<Menu>>(
          stream: dbHelper.getMenuList(),
          builder: (context, snapshot) {
            var collectionMenuListData = snapshot.data;
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: collectionMenuListData.length,
                itemBuilder: (context, index) {
                  var menuData = collectionMenuListData[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      tileColor: Colors.black12,
                      leading: Text('${index + 1}'),
                      title: Text(menuData.nama),
                      trailing: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builder) {
                                return UpdateMenu(menuData);
                              },
                            ),
                          );
                        },
                        icon: Icon(Icons.edit),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
