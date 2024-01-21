import 'package:eco_market/features/cart/domain/entities/order_entity.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    super.address,
    super.comments,
    super.createdAt,
    super.deliveryCost,
    super.orderNumber,
    super.orderedProducts,
    super.phoneNumber,
    super.referencePoint,
    super.totalAmount,
  });

  // factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
  //       orderNumber: json["order_number"],
  //       phoneNumber: json["phone_number"],
  //       address: json["address"],
  //       referencePoint: json["reference_point"],
  //       comments: json["comments"],
  //       totalAmount: json["total_amount"],
  //       createdAt: json["created_at"],
  //       deliveryCost: json["delivery_cost"],
  //       orderedProducts: List<OrderedProduct>.from(
  //           json["ordered_products"].map((x) => OrderedProduct.fromJson(x))),
  //     );

  // Map<String, dynamic> toJson() => {
  //       "order_number": orderNumber,
  //       "phone_number": phoneNumber,
  //       "address": address,
  //       "reference_point": referencePoint,
  //       "comments": comments,
  //       "total_amount": totalAmount,
  //       "created_at": createdAt,
  //       "delivery_cost": deliveryCost,
  //       "ordered_products":
  //           List<dynamic>.from(orderedProducts!.map((x) => x.toJson())),
  //     };
}
