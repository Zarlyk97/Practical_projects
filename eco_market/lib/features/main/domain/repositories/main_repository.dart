import 'package:eco_market/features/main/domain/entities/category_entity.dart';

abstract class MainRepoistory {
  Future<List<CategoryEntity>> getCategory();
}
