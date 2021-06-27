class Penjualan {
  int _id;
  String _nama;
  String _desc;
  int _jumlah;
  String _tanggal;

  Penjualan(this._nama, this._desc, this._jumlah, this._tanggal);
  Penjualan.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._nama = map['nama'].toString();
    this._desc = map['desc'].toString();
    this._jumlah = map['jumlah'];
    this._tanggal = map['tanggal'].toString();
  }

  int get id => _id;
  // ignore: unnecessary_getters_setters
  String get nama => _nama;
  // ignore: unnecessary_getters_setters
  String get desc => _desc;
  // ignore: unnecessary_getters_setters
  int get jumlah => _jumlah;
  // ignore: unnecessary_getters_setters
  String get tanggal => _tanggal;

  // ignore: unnecessary_getters_setters
  set nama(String value) {
    _nama = value;
  }

  // ignore: unnecessary_getters_setters
  set desc(String value) {
    _desc = value;
  }

  // ignore: unnecessary_getters_setters
  set jumlah(int value) {
    _jumlah = value;
  }

  // ignore: unnecessary_getters_setters
  set tanggal(String value) {
    _tanggal = value;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['nama'] = this._nama;
    map['desc'] = this._desc;
    map['jumlah'] = this._jumlah;
    map['tanggal'] = this._tanggal;
    return map;
  }
}
