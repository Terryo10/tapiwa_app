
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tapiwa_app/authentication/LoginClient.dart';
import 'package:tapiwa_app/models/LoginResponseModel.dart';
import 'package:tapiwa_app/ui/home.dart';
import 'package:tapiwa_app/ui/register.dart';
import 'package:tapiwa_app/utils/auth.dart';
import 'package:tapiwa_app/utils/auth.dart';
import 'package:http/http.dart' as http;
import 'package:tapiwa_app/utils/LoginUtil.dart';
import 'package:tapiwa_app/storage/SharedPreferenceManager.dart';

import 'package:flutter/material.dart';
import 'package:chopper/chopper.dart';
import 'package:provider/provider.dart';

import 'package:tapiwa_app/api/api_service.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final auth = new Auth();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  bool isEmailValid(email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return !emailValid;
  }


   TextEditingController emailController = new TextEditingController();
   TextEditingController passwordController = new TextEditingController();

     final LoginUtil loginUtil = new LoginUtil();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    //final LoginAuth loginAuth = new LoginAuth();
  
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/boozelogo.png'),
      ),
    );
    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: emailController,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      validator: (value) {
        if (isEmailValid(value) || value.isEmpty) {
          return 'Please enter valid email';
        }
        return null;
      },
    );

    final password = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      validator: (value) {
        if (value.isEmpty || value.length < 6) {
          return 'Your Password must be more than 6 chars';
        }
        return null;
      },
    );

    final loginButton = !isLoading
        ? Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          onPressed: () {
            if (_formKey.currentState.validate()) {
              print('loading');
              setState(() {
                isLoading = true;
              });

             //loginAuth.login(emailController.text, passwordController.text, "password", loginUtil.getClientAuthorizationHeader());
                 
                 _authenticate(context);

                // FutureBuilder<LoginResponseModel> builder = 
                // LoginService.create(
                // .loginUser(emailController.text, passwordController.text, "password", loginUtil.getClientAuthorizationHeader()) as FutureBuilder<LoginResponseModel>;
           
//             sharedPreferenceManager.saveUserCredentials(loginResponseModel);

            }
          },
          padding: EdgeInsets.all(12),
          color: Colors.brown,
          child: Text('Log In', style: TextStyle(color: Colors.white)),
        ))
        : Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.cyan,
        strokeWidth: 5,
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    final registerLabel = FlatButton(
      child: Text(
        'Sign Up',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () => Navigator.of(context)
          .push(new MaterialPageRoute(builder: (context) => new Register())),
    );

    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  email,
                  SizedBox(height: 8.0),
                  password,
                  SizedBox(height: 24.0),
                  loginButton,
                  forgotLabel,
                  registerLabel
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  FutureBuilder<Response<LoginResponseModel>> _authenticate(BuildContext context) {


        return FutureBuilder<Response<LoginResponseModel>>(
    
    
          future: Provider.of<LoginService>(context).loginUser(emailController.text, passwordController.text, "password", loginUtil.getClientAuthorizationHeader()),
          
         builder: (context,snapshot){

           if(snapshot.connectionState == ConnectionState.done){
            
              return new Text("Login Successful");

           }

           else {
          // Show a loading indicator while waiting for the posts
          return Center(
            child: CircularProgressIndicator(),
          );
        }

         },

    );

  }





}
