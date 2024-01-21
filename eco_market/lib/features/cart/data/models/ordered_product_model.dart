class OrderedProductModel {
  int product;
  int quantity;

  OrderedProductModel({
    required this.product,
    required this.quantity,
  });
  factory OrderedProductModel.fromJson(Map<String, dynamic> json) =>
      OrderedProductModel(
        product: json["product"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "product": product,
        "quantity": quantity,
      };
}
