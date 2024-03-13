part of 'categories_bloc.dart';

sealed class CategoriesState extends Equatable {
  final CategoriesEntity? categoriesEntity;
  final DioException? exception;

  const CategoriesState({this.categoriesEntity, this.exception});

  @override
  List<Object> get props => [];
}

final class CategoriesLoading extends CategoriesState {
  const CategoriesLoading();
}

final class CategoriesDone extends CategoriesState {
  const CategoriesDone(CategoriesEntity? categoriesEntity)
      : super(categoriesEntity: categoriesEntity);
}

final class CategoriesException extends CategoriesState {
  const CategoriesException(DioException? exception)
      : super(exception: exception);
}
