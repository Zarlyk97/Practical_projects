class Product {
  Product({
    required this.name,
    required this.price,
  });

  String name;
  double price;

  @override
  String toString() {
    return name;
  }
}
