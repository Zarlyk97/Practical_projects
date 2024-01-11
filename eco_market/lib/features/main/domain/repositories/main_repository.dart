import 'package:eco_market/features/main/domain/entities/product_entity.dart';

abstract class MainRepoistory {
  Future<List<CotegoryEntity>> getProducts();
}
