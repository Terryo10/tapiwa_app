//import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:tapiwa_app/models/LoginResponseModel.dart';
import 'package:tapiwa_app/storage/SharedPreferenceManager.dart';

class LoginAuth {
  String username;
  String password;
//  String grant_type;
//  String auth;

  final String BASE_URL = "http://192.168.100.18:5000/";

  BuildContext _context;

  void login(
      String username, String password, String grant_type, String auth) async {
    var response = await http.post(BASE_URL + 'oauth/token', headers: {
      'Accept': 'application/json',

    }, body: {
      'username': username,
      'password': password,
      'grant_type': grant_type,
      "Authorization": "Bearer"+ auth,
    });

//    http.post(BASE_URL + 'oauth/token',
//
//        body: json.encode(body),
//        headers: { 'Content-type': 'application/json',
//          'Accept': 'application/json',
//          "Authorization": "Bearer"},
//        );

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      LoginResponseModel responseModel = jsonResponse;

      final SharedPreferenceManager sharedPreferenceManager =
          new SharedPreferenceManager(context);

      sharedPreferenceManager.saveUserCredentials(responseModel);

      print(jsonResponse);
    } else {
      print('Error occured' + response.body);
    }
  }

  BuildContext get context => _context;

  set context(BuildContext value) {
    _context = value;
  }

//    if (response.statusCode == 200) {
//      var jsonResponse = convert.jsonDecode(response.body);
//      SharedPreferences prefs = await SharedPreferences.getInstance();
//      await prefs.setInt('token', jsonResponse.access_token);
//      print(jsonResponse);
//    } else {
//      print('Error occured ' + response.body.toString());
//    }
//  }
}
