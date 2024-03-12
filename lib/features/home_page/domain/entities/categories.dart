import 'package:equatable/equatable.dart';

class CategoriesEntity extends Equatable {
  final List<dynamic> categories;

  const CategoriesEntity({required this.categories});

  @override
  List<Object?> get props => [categories];
}
