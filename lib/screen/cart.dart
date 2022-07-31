import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:flutter_login/model/cart_model.dart';

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
      body: Column(
        children:  [
          const Padding(
            padding: EdgeInsets.all(32.0),
            child: Placeholder(),
          ),
          const Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatefulWidget {
  _CartTotal({Key? key}) : super(key: key);

  @override
  State<_CartTotal> createState() => __CartTotalState();
}

class __CartTotalState extends State<_CartTotal> {
  final _cart=CartModel();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:  [
            Text("${_cart.totalPrice}"),
            ElevatedButton(onPressed: () {}, child: const Text("Buy"))
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  _CartList({Key? key}) : super(key: key);

  @override
  State<_CartList> createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  @override
  final _cart=CartModel();
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(icon: Icon(Icons.remove),onPressed: () {},),
        title: Text(_cart.items[index].name),
      ) ,
    );
  }
}