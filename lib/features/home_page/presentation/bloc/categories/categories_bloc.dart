import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_site/core/resources/data_state.dart';
import 'package:e_commerce_site/features/home_page/domain/entities/categories.dart';
import 'package:e_commerce_site/features/home_page/domain/usecase/get_categories_use_case.dart';
import 'package:equatable/equatable.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final GetCategoriesUseCase _getCategoriesUseCase;

  CategoriesBloc(this._getCategoriesUseCase) : super(CategoriesLoading()) {
    on<CategoriesEvent>(onGetCategories);
  }

  void onGetCategories(
      CategoriesEvent event, Emitter<CategoriesState> emit) async {
    final categoriesState = await _getCategoriesUseCase();
    if (categoriesState is DataSuccess) {
      emit(CategoriesDone(state.categoriesEntity));
    } else if (categoriesState is DataFailed) {
      emit(CategoriesException(state.exception));
    }
  }
}
