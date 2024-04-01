import 'package:e_commerce_site/features/home_page/domain/entities/product.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.title,
    required super.price,
    required super.category,
    required super.description,
    required super.image,
    required RatingModel super.rating,
  });

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
  const RatingModel({required super.count, required super.rate});

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
