// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$LoginService extends LoginService {
  _$LoginService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = LoginService;

  Future<Response<LoginResponseModel>> loginUser(
      String username, String password, String grant_type, String auth) {
    final $url = 'http://192.168.100.18:5000/';
    final $headers = {'Authorization': auth, 'accept': 'application/json'};
    final $body = {
      'username': username,
      'password': password,
      'grant_type': grant_type
    };
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send($request);
  }
}
