import 'package:flutter/material.dart';
import 'package:tapiwa_app/ui/cart.dart';
import 'package:tapiwa_app/ui/login.dart';
import 'package:tapiwa_app/ui/product_details.dart';

class DrawerApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DrawerState();
  }

}


class DrawerState extends State<DrawerApp>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  new Drawer(
      child: new ListView(
        children: <Widget>[
          //header yangu
          new UserAccountsDrawerHeader(accountName: Text('Tapiwa Tererai'),
            accountEmail: Text('tapiwatererai@outlook.com'),
            currentAccountPicture: GestureDetector(
              child: new CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon (Icons.person, color: Colors.white,),
              ),
            ),
            decoration: new BoxDecoration(
                color: Colors.brown
            ),
          ),
          //body ye drawer

          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('My Account'),
              leading: Icon(Icons.person),
            ),
          ),

          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('My Oders'),
              leading: Icon(Icons.shopping_basket),
            ),
          ),

          InkWell(
            onTap:  ()=> Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) => new Cart())),
            child: ListTile(
              title: Text('Cart'),
              leading: Icon(Icons.shopping_cart),
            ),
          ),

          InkWell(

            onTap:(){},
            child: ListTile(
              title: Text('Cartegories'),
              leading: Icon(Icons.dashboard),
            ),
          ),

          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('Wish List'),
              leading: Icon(Icons.favorite),
            ),
          ),

          Divider(),

          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings, color: Colors.blue,),
            ),
          ),

          InkWell(
            onTap:(){},
            child: ListTile(
              title: Text('About'),
              leading: Icon(Icons.help, color: Colors.green),
            ),
          ),


          InkWell(
            onTap:()=> Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) => new ProductDetails())),
            child: ListTile(
              title: Text('productD'),
              leading: Icon(Icons.help, color: Colors.green),
            ),
          ),
          InkWell(
            onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) => new Login())),
            child: ListTile(
              title: Text('Sign Out'),
              leading: Icon(Icons.exit_to_app, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

}