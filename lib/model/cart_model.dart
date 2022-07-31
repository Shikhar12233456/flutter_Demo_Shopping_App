import 'package:flutter_login/model/products.dart';
import 'package:flutter_login/screen/productPage.dart';

class CartModel {
  late ProductModel _pr;
  final List<num> _itemids = [];

  ProductModel get productx => _pr;
  set productx(ProductModel newProduct) {
    assert(newProduct != null);
    _pr = newProduct;
  }

  List<product> get items => _itemids.map((id) => _pr.getByID(id)).toList();

  num get totalPrice =>
      items.fold(0, (previousValue, element) => previousValue + element.price);

  void add(product pro) {
    _itemids.add(pro.id);
  }

  void remove(product pro) {
    _itemids.remove(pro.id);
  }
}
