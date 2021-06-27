class Menu {
  int _id;
  String _nama;
  String _desc;
  String _harga;
  String _gambar;
  String _star;

  Menu(this._nama, this._desc, this._harga, this._gambar, this._star);
  Menu.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._nama = map['nama'].toString();
    this._desc = map['desc'].toString();
    this._harga = map['harga'].toString();
    this._gambar = map['gambar'].toString();
    this._star = map['star'].toString();
  }

  int get id => _id;
  // ignore: unnecessary_getters_setters
  String get nama => _nama;
  // ignore: unnecessary_getters_setters
  String get desc => _desc;
  // ignore: unnecessary_getters_setters
  String get harga => _harga;
  // ignore: unnecessary_getters_setters
  String get star => _star;
  // ignore: unnecessary_getters_setters
  String get gambar => _gambar;

  // ignore: unnecessary_getters_setters
  set nama(String value) {
    _nama = value;
  }

  // ignore: unnecessary_getters_setters
  set desc(String value) {
    _desc = value;
  }

  // ignore: unnecessary_getters_setters
  set harga(String value) {
    _harga = value;
  }

  // ignore: unnecessary_getters_setters
  set star(String value) {
    _star = value;
  }

  // ignore: unnecessary_getters_setters
  set gambar(String value) {
    _gambar = value;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['nama'] = this._nama;
    map['desc'] = this._desc;
    map['harga'] = this._harga;
    map['gambar'] = this._gambar;
    map['star'] = this._star;
    return map;
  }
}
