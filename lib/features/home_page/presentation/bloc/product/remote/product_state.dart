part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  final List<ProductEntity>? products;
  final DioException? exception;

  const ProductState({this.exception, this.products});

  @override
  List<Object> get props => [products!, exception!];
}

final class ProductsLoading extends ProductState {
  const ProductsLoading();
}

final class ProductsDone extends ProductState {
  const ProductsDone(List<ProductEntity> products) : super(products: products);
}

final class ProductsException extends ProductState {
  const ProductsException(DioException exception) : super(exception: exception);
}
