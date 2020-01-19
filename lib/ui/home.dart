import 'package:flutter/material.dart';
import 'package:tapiwa_app/ui/components/bottomnav.dart';
import 'package:tapiwa_app/ui/components/drawer.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }



}

class HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.brown,
        title: Text('Booze'),
      ),
      drawer: DrawerApp(),
      bottomNavigationBar:  BottomNav(),

      body: new ListView(

      ),
    );



}

}