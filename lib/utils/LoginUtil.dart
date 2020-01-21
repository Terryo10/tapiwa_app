import 'dart:convert';


class LoginUtil{

  String fetchClientAuthorizationHeader(String userName, String password) {
    String credentials = userName + ":" + password;
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encoded = stringToBase64.encode(credentials);      // dXNlcm5hbWU6cGFzc3dvcmQ=
    String decoded = stringToBase64.decode(encoded);
    return "Basic " + decoded;
  }


 String getClientAuthorizationHeader() {
    return fetchClientAuthorizationHeader("1", "EUP4hcCSgBSZnNQe5GSenHDqzsitr2cYH1l6varO");
  }

}