import 'package:e_commerce_site/features/home_page/domain/entities/product.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required final int id,
    required final String title,
    required final double price,
    required final String category,
    required final String description,
    required final String image,
    required final RatingModel rating,
  }) : super(
          id: id,
          title: title,
          price: price,
          category: category,
          description: description,
          image: image,
          rating: rating,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'] ?? 0,
        title: json['title'] ?? '',
        price: json['price'] ?? 0.0,
        category: json['category'] ?? '',
        description: json['description'] ?? '',
        image: json['image'] ?? '',
        rating: RatingModel.fromJson(json['rating'] ?? {}));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'category': category,
      'description': description,
      'image': image,
      'rating': (rating as RatingModel).toJson()
    };
  }
}

class RatingModel extends RatingEntity {
  const RatingModel({required final int count, required final double rate})
      : super(
          count: count,
          rate: rate,
        );

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(count: json['count'] ?? 0, rate: json['rate'] ?? 0.0);
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'rate': rate,
    };
  }
}
