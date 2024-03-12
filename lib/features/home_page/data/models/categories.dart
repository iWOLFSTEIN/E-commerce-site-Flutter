import 'package:e_commerce_site/features/home_page/domain/entities/categories.dart';

class CategoriesModel extends CategoriesEntity {
  const CategoriesModel({List<String>? categories})
      : super(categories: categories ?? const []);

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      categories: json['categories'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categories': categories,
    };
  }
}
