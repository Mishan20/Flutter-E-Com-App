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
    return Product(
      description: map['description'],
      id: map['id'],
      image: map['image'],
      name: map['name'],
      price: double.parse(map['price']),
      type: map['type'],
    );
  }
}
