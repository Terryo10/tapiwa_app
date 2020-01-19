import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BottomNavState();
  }

}

class BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new BottomNavigationBar(
      currentIndex: 0, // this will be set when a new tab is tapped
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          title: new Text('Home'),
        ),
        BottomNavigationBarItem(

          icon: new Icon(Icons.shopping_cart),
          title: new Text('My Cart'),

        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.motorcycle),
            title: Text('Delivery')
        )
      ],
    );
  }
}