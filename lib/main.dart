import 'package:basicwidgets_components/shoppinglistitem.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Simple shopping App',
    theme: ThemeData(primaryColor: Colors.cyanAccent),
    home: ShoppingList(
      products: <Product>[
        Product(name: 'Vegges'),
        Product(name: 'Milk'),
        Product(name: 'Eggs'),
      ],
    ),
  ));
}

class ShoppingList extends StatefulWidget{
  ShoppingList({Key, key, this.products}) : super(key :key);
  final List<Product> products;

  createState(){
    return ShoppingListState();
  }
}

class ShoppingListState extends State<ShoppingList>{
 Set<Product> _shoppingCart = Set<Product>();

 void _handleCartChanged(Product product, bool inCart){
   setState(() {
     if(!inCart)
     _shoppingCart.add(product);
     else
     _shoppingCart.remove(product);
   });
 }
  Widget build(contxet){
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product){
          return ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}