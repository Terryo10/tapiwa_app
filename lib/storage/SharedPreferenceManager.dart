
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:tapiwa_app/models/LoginResponseModel.dart';

class SharedPreferenceManager{

  final String SHARED_PREF_NAME="user_shared_preff";
  SharedPreferenceManager mInstance;
  BuildContext _context;

  SharedPreferenceManager(this._context);


   SharedPreferenceManager getInstance(BuildContext context){
    if (mInstance==null){

      mInstance=new SharedPreferenceManager(context);
    }
    return mInstance;
  }


  void saveUserCredentials(LoginResponseModel userLoginResponseModel) async{

     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setString("access_token",userLoginResponseModel.access_token);
    sharedPreferences.setString("token_type",userLoginResponseModel.token_type);
    sharedPreferences.setString("refresh_token",userLoginResponseModel.refresh_token);
    sharedPreferences.setInt("expires_in",userLoginResponseModel.expires_in);

    sharedPreferences.commit();
  }



  Future<bool> isLogggedIn() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    return sharedPreferences.get("token");

  }


  LoginResponseModel userLoginResponseModel() {
    SharedPreferences sharedPreferences = SharedPreferences.getInstance() as SharedPreferences;

    return new LoginResponseModel(
        sharedPreferences.get("access_token"),
        sharedPreferences.get("token_type"),
        sharedPreferences.get("refresh_token"),
        sharedPreferences.get("expires_in")
    );

  }


  String getUserAuthorizationHeader() {

    LoginResponseModel userLoginResponseModel = this.userLoginResponseModel();

    return "Bearer "+ userLoginResponseModel.access_token;
  }

 void clear(){
   SharedPreferences sharedPreferences = SharedPreferences.getInstance() as SharedPreferences;
   sharedPreferences.clear();
   sharedPreferences.commit();
  }




}