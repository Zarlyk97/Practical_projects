// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  String name;
  double price;
  Product({
    required this.name,
    required this.price,
  });

  @override
  String toString() {
    return name;
  }
}
