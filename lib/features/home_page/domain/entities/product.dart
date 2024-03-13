import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final double price;
  final String category;
  final String image;

  const ProductEntity(
      {required this.category,
      required this.description,
      required this.id,
      required this.image,
      required this.price,
      required this.title});

  @override
  List<Object?> get props => [id, title, description, price, category, image];
}
