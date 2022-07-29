class ProductModel {
  static List<product> items = [];
}

class product {
  num id;
  String name;
  String descr;
  num price;
  String imageUrl;

  product(
      {required this.id,
      required this.name,
      required this.descr,
      required this.price,
      required this.imageUrl});

  factory product.fromMap(Map<dynamic, dynamic> map) {
    return product(
        id: map['id'],
        name: map['name'],
        descr: map['descr'],
        price: map['price'],
        imageUrl: map['imageUrl']);
  }

  tomap() => {
        "id": id,
        "name": name,
        "descr": descr,
        "price": price,
        "imageUrl": imageUrl
      };
}
