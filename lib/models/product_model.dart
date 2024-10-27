import 'package:logger/logger.dart';

class Product {
  String description;
  String id;
  String image;
  String name;
  double price;
  String type;

  Product({
    required this.description,
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.type,
  });

  factory Product.fromJson(Map<String, dynamic> map) {
    try {
      return Product(
        description: map['description'],
        id: map['id'],
        image: map['image'],
        name: map['name'],
        price: double.parse(map['price']),
        type: map['type'],
      );
    } catch (e) {
      Logger().e(e);
      return Product(
        description: "",
        id: "",
        image: "",
        name: "",
        price: 0,
        type: "",
      );
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "description": description,
      "id": id,
      "image": image,
      "name": name,
      "price": price.toString(),
      "type": type,
    };
  }
}

