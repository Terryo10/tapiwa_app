import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProductDetailsState();
  }

}


//class ProductDetailsState extends State<ProductDetails>{
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return null;
//  }
//
//}


class ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.brown,
        title: Text('Product Details'),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search), color: Colors.white, onPressed:(){}),
          new IconButton(icon: Icon(Icons.shopping_cart), color: Colors.white, onPressed:(){})
        ],
      ),

      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
               // child: Image.network(widget.product_detail_picture),
              ),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text('Mango',
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 16.0),),
                  title:  new Row(
                    children: <Widget>[
                      Expanded(
                        //widget.product_detail_old_price
                          child:  new Text("1000",
                            style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),)
                      ),

                      Expanded(
                          child:  new Text("500",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.brown
                            ),)
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ),

          Row(
            children: <Widget>[
              //button  re quantity
              Expanded(
                child:  MaterialButton(onPressed: (){},
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text("Qty"),

                      ),
                      Expanded(
                          child: new Icon(Icons.arrow_drop_down)
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Row(
            children: <Widget>[
              //button  re quantity
              Expanded(
                child:  MaterialButton(onPressed: (){},
                    color: Colors.brown,
                    textColor: Colors.white,
                    elevation: 0.2,
                    child: new Text("Add to Cart")
                ),
              ),

              new IconButton(icon: Icon(Icons.add_shopping_cart),color:Colors.brown,  onPressed:(){}),

              new IconButton(icon: Icon(Icons.favorite_border),color:Colors.brown, onPressed:(){}),
            ],
          ),
          Divider(),
          new ListTile(
            title: new Text("Product details"),
            subtitle: new Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
          ),
          Divider(),

          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Product Name", style: TextStyle(color: Colors.grey),),),
              Padding(padding: EdgeInsets.all(5.0),
                child: new Text('Mango'),)

            ],
          ),

          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Stock Status", style: TextStyle(color: Colors.grey),),),
              Padding(padding: EdgeInsets.all(5.0),
                child: new Text("In Stock"),)
            ],
          ),

        ],
      ),
    );
  }
}
