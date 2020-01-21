class LoginResponseModel{

  String _token_type;
  int _expires_in;
  String _access_token;
  String _refresh_token;

  LoginResponseModel(this._token_type, this._expires_in, this._access_token,
      this._refresh_token);

  String get token_type => _token_type;

  set token_type(String value) {
    _token_type = value;
  }

  int get expires_in => _expires_in;

  String get refresh_token => _refresh_token;

  set refresh_token(String value) {
    _refresh_token = value;
  }

  String get access_token => _access_token;

  set access_token(String value) {
    _access_token = value;
  }

  set expires_in(int value) {
    _expires_in = value;
  }


}