import 'package:e_commerce_site/features/home_page/domain/entities/product.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required final int id,
    required final String title,
    required final double price,
    required final String category,
    required final String description,
    required final String image,
    required final double rate,
  }) : super(
            id: id,
            title: title,
            price: price,
            category: category,
            description: description,
            image: image,
            rate: rate);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'] ?? 0,
        title: json['title'] ?? '',
        price: json['price'] ?? 0.0,
        category: json['category'] ?? '',
        description: json['description'] ?? '',
        image: json['image'] ?? '',
        rate: json['rating']['rate'] ?? 0.0);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'category': category,
      'description': description,
      'image': image,
      'rating': {'rate': rate}
    };
  }
}
