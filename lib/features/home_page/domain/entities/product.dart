import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final double price;
  final String category;
  final String image;
  final RatingEntity rating;

  const ProductEntity(
      {required this.category,
      required this.description,
      required this.id,
      required this.image,
      required this.price,
      required this.title,
      required this.rating});

  @override
  List<Object?> get props =>
      [id, title, description, price, category, image, rating];
}

class RatingEntity extends Equatable {
  final double rate;
  final int count;

  const RatingEntity({required this.count, required this.rate});

  @override
  List<Object?> get props => [rate, count];
}
