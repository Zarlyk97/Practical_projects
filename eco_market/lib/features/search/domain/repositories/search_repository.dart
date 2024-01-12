// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:eco_market/features/search/domain/entities/products_entity.dart';

abstract class Searchrepository {
  Future<List<ProductEntity>> getProducts();
}
