import 'package:e_commerce_site/features/home_page/domain/entities/product.dart';

class ProductModel extends ProductEntity {
  const ProductModel(
      {required int id,
      required String title,
      required double price,
      required String category,
      required String description,
      required String image})
      : super(
            id: id,
            title: title,
            price: price,
            category: category,
            description: description,
            image: image);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      price: json['price'] ?? 0.0,
      category: json['category'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'category': category,
      'description': description,
      'image': image,
    };
  }
}
