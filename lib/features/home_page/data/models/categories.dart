import 'package:e_commerce_site/features/home_page/domain/entities/categories.dart';

class CategoriesModel extends CategoriesEntity {
  const CategoriesModel({List<dynamic>? categories})
      : super(categories: categories ?? const []);

  factory CategoriesModel.fromJson(List<dynamic>? json) {
    return CategoriesModel(
      categories: json ?? [],
    );
  }

  List<dynamic> toJson() {
    return categories;
  }
}
