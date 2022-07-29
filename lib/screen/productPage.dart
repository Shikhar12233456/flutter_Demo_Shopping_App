import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:flutter_login/model/products.dart';
import 'package:flutter_login/screen/homescreen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class productPage extends StatefulWidget {
  final product prd;
  const productPage(this.prd, {Key? key}) : super(key: key);

  @override
  State<productPage> createState() => _productPageState();
}

class _productPageState extends State<productPage> {
  var cart = FlutterCart();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.prd.name),
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => homescreen(),
                      ));
                },
                icon: const Icon(Icons.arrow_back_ios_rounded));
          },
        ),
      ),
      body: Card(
        child: Column(
          children: [
            Image.asset(widget.prd.imageUrl),
            Text(widget.prd.name),
            Text(widget.prd.descr),
            Text("${widget.prd.price}"),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 5),
              child: ElevatedButton(
                  onPressed: () {
                    cart.addToCart(
                        productId: widget.prd.id, unitPrice: widget.prd.price);
                    Fluttertoast.showToast(msg: "item added to cart");
                  },
                  child: const Text("Add to Cart")),
            ),
          ],
        ),
      ),
    );
  }
}
