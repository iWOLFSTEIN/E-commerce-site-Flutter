import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final double? price;
  final String? category;
  final String? image;

  const ProductEntity(
      {this.category,
      this.description,
      this.id,
      this.image,
      this.price,
      this.title});

  @override
  List<Object?> get props => [id, title, description, price, category, image];
}
