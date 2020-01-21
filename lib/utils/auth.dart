//import 'package:flutter/material.dart';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  String username;
  String password;
  String name;
  String confirmPassword;

  String base_url = "http://192.168.100.18:5000";

  void register(String username, String password, String name,
      String confirmPassword) async {
    var response = await http.post(base_url + '/api/register', body: {
      'email': username,
      'name': name,
      'password': password,
      'confirm_password': confirmPassword
    });
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);
    } else {
      print('Error occured' + response.statusCode.toString());
    }
  }

  void login(String username, String password) async {
    var response = await http.post(base_url + '/api/login', headers: {
      'Accept': 'application/json',

    }, body: {
      'username': username,
      'password': password,

    });

    print(response.body.toString());
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('token', jsonResponse.access_token);
      print(jsonResponse);
    } else {
      print('Error occured ' + response.body.toString());
    }
  }
}
