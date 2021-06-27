import 'package:flutter_application_wahyu/models/menu.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_application_wahyu/models/penjualan.dart';

class DbHelper {
  static DbHelper _dbHelper;

  static Database _database;

  List<Map<String, dynamic>> _dataPenjualan;
  List<Map<String, dynamic>> get dataNote => _dataPenjualan;

  List<Map<String, dynamic>> _dataMenu;
  List<Map<String, dynamic>> get dataMenu => _dataMenu;

  DbHelper._createObject();
  factory DbHelper() {
    if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
    }
    return _dbHelper;
  }
  Future<Database> initDb() async {
    Directory documentsdirectory = await getApplicationDocumentsDirectory();
    String path = documentsdirectory.path + 'Penjualan.db';
    var todoDatabase = openDatabase(path, version: 1, onCreate: _createDb);
    return todoDatabase;
  }

  void _createDb(Database db, int version) async {
    await db.execute('''
                  CREATE TABLE penjualan (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    nama TEXT,
                    desc TEXT,
                    jumlah INTEGER,
                    tanggal TEXT
                  )
                ''');
    await db.execute('''
                  CREATE TABLE menu (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    nama TEXT,
                    desc TEXT,
                    harga TEXT,
                    gambar TEXT,
                    star TEXT
                  )
                ''');
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }

  // Bagian penjualan

  Future<List<Map<String, dynamic>>> selectPenjualan() async {
    Database db = await this.database;
    var mapList = await db.query('penjualan', orderBy: 'nama');
    return mapList;
  }

  Future<List<Penjualan>> getTotalPenjualan(String namaOrder) async {
    Database db = await this.database;
    List<Penjualan> penjualanList = List<Penjualan>();
    List<Map<String, dynamic>> total;
    try {
      total = await db.query('penjualan',
          columns: ['jumlah'], where: 'nama=?', whereArgs: [namaOrder]);
    } catch (e) {
      total = [];
    }
    if (total.isNotEmpty) {
      penjualanList.add(Penjualan.fromMap(total[0]));
    } else {
      penjualanList.add(Penjualan('', '', 0, ''));
    }
    return penjualanList;
  }

  Future<void> insertPenjualan(Penjualan penjualan) async {
    Database db = await this.database;
    var checkIsPenjualanAda = await db
        .query('penjualan', where: 'nama=?', whereArgs: [penjualan.nama]);
    if (checkIsPenjualanAda.isEmpty) {
      await db.insert('penjualan', penjualan.toMap());
    } else {
      print(penjualan.nama);
      await updatePenjualan(penjualan);
    }
  }

  Future<void> updatePenjualan(Penjualan object) async {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['jumlah'] = object.jumlah;

    Database db = await this.database;
    await db
        .update('penjualan', map, where: 'nama=?', whereArgs: [object.nama]);
  }

  Future<void> deletePenjualan(String namaOrder) async {
    Database db = await this.database;
    await db.delete('penjualan', where: 'nama=?', whereArgs: [namaOrder]);
  }

  Stream<List<Penjualan>> getPenjualanList() async* {
    while (true) {
      var penjualanMapList = await selectPenjualan();
      int count = penjualanMapList.length;
      // ignore: deprecated_member_use
      List<Penjualan> penjualanList = List<Penjualan>();
      for (int i = 0; i < count; i++) {
        penjualanList.add(Penjualan.fromMap(penjualanMapList[i]));
      }
      yield penjualanList;
    }
  }

  // Bagian menu

  Future<List<Map<String, dynamic>>> selectMenu() async {
    Database db = await this.database;
    var mapList = await db.query('menu', orderBy: 'nama');
    return mapList;
  }

  Future<bool> insertMenu(Menu object) async {
    Database db = await this.database;
    await db.insert('menu', object.toMap());
    return true;
  }

  Stream<List<Menu>> getMenuList() async* {
    while (true) {
      var menuMapList = await selectMenu();
      int count = menuMapList.length;
      // ignore: deprecated_member_use
      List<Menu> menuList = List<Menu>();
      for (int i = 0; i < count; i++) {
        menuList.add(Menu.fromMap(menuMapList[i]));
      }
      yield menuList;
    }
  }

  Future<int> deleteMenu(int id) async {
    Database db = await this.database;
    int count = await db.delete('menu', where: 'id=?', whereArgs: [id]);
    return count;
  }

  Future<int> updateMenu(Menu object) async {
    Database db = await this.database;
    int count = await db
        .update('menu', object.toMap(), where: 'id=?', whereArgs: [object.id]);
    return count;
  }
}
