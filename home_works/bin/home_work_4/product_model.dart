class ProductModel {
  ProductModel({
    required this.name,
    required this.price,
  });

  final String name;
  final double price;

  @override
  String toString() {
    return name;
  }
}
