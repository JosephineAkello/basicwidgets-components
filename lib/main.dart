import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title: 'Simple shopping App',
    home: ShoppingList(),
  ));
}

class ShoppingList extends StatefulWidget{
  createState(){
    return ShoppingListState();
  }
}

class ShoppingListState extends State<ShoppingList>{
  Widget build(contxet){
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: ListView(),
    );
  }
}