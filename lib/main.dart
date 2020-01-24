import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tapiwa_app/api/api_service.dart';
import 'package:tapiwa_app/ui/home.dart';
import 'package:tapiwa_app/ui/login.dart';


void main() => runApp(BoozeApp());

class BoozeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Provider(
      // The initialized LoginService is now available down the widget tree
      builder: (_) => LoginService.create(),
      // Always call dispose on the ChopperClient to release resources
      dispose: (context, LoginService service) => service.client.dispose(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Login(),
      ), 
    );
  }
  

 
}

