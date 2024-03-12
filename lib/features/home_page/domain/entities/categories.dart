import 'package:equatable/equatable.dart';

class CategoriesEntity extends Equatable {
  final List<String> categories;

  const CategoriesEntity({required this.categories});

  @override
  List<Object?> get props => [categories];
}
