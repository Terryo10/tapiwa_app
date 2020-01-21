class UserRegistrationModel{

  String _name;
  String _email;
  String _password;
  String _confirm_password;

  UserRegistrationModel(this._name, this._email, this._password,
      this._confirm_password);


  UserRegistrationModel.map(dynamic obj) {
    this._email = obj["email"];
    this._password = obj["password"];
  }

  String get name => _name;
  String get email => _email;
  String get password => _password;
  String get confirm_password => _confirm_password;


  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["email"] = _email;
    map["password"] = _password;

    return map;
  }
}