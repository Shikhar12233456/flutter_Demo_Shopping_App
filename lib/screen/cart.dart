import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';

class cart extends StatefulWidget {
  cart({Key? key}) : super(key: key);

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  var cart = FlutterCart();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:  Text(" "),
      ),
    );
  }
}
