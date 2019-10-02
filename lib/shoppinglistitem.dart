import 'package:flutter/material.dart';

class Product{
  const Product({this.name});
  final String name;
}

typedef void CartChangedCallback(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget{
  ShoppingListItem({Product product, this.inCart, this.onCartChanged})
  : product = product,
  super(key: ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(context){
    return inCart ? Colors.black38 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(context){
    if(!inCart) return null;
  

  return TextStyle(
    color: Colors.black38,
    decoration: TextDecoration.lineThrough,
  );
  }
  Widget build(context){
    return ListTile(
      onTap: (){
        onCartChanged(product, inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
        ),
        title: Text(product.name, style:_getTextStyle(context)),
    );
  }
}