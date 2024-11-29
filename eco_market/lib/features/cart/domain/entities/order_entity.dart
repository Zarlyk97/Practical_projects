import 'package:eco_market/features/cart/domain/models/models.dart';

class OrderEntity {
  int? orderNumber;
  String? phoneNumber;
  String? address;
  String? referencePoint;
  String? comments;
  String? totalAmount;
  String? createdAt;
  int? deliveryCost;
  List<OrderedProductModel>? orderedProducts;

  OrderEntity({
    this.orderNumber,
    this.phoneNumber,
    this.address,
    this.referencePoint,
    this.comments,
    this.totalAmount,
    this.createdAt,
    this.deliveryCost,
    this.orderedProducts,
  });
}
