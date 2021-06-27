class Autentikasi {
  int _id;
  String _email;
  String _password;
  String _security;

  Autentikasi(this._email, this._password, this._security);
  Autentikasi.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._email = map['email'].toString();
    this._password = map['password'].toString();
    this._security = map['security'].toString();
  }

  int get id => _id;
  // ignore: unnecessary_getters_setters
  String get email => _email;
  // ignore: unnecessary_getters_setters
  String get password => _password;
  // ignore: unnecessary_getters_setters
  String get security => _security;

  // ignore: unnecessary_getters_setters
  set email(String value) {
    _email = value;
  }

  // ignore: unnecessary_getters_setters
  set password(String value) {
    _password = value;
  }

  // ignore: unnecessary_getters_setters
  set security(String value) {
    _security = value;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['email'] = this._email;
    map['password'] = this._password;
    map['harga'] = this._security;
    return map;
  }
}
