// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:timbo/repositories/category_repo/category_repo.dart';

import '../../model/top_category_response_model/top_category_response_model.dart';

part 'top_category_state.dart';

class TopCategoryCubit extends Cubit<TopCategoryState> {
  final CategoryRepo _categoryRepo = CategoryRepo();
  TopCategoryCubit() : super(const TopCategoryInitial([])) {
    getTopcategory();
  }

  void getTopcategory() async {
    try {
      emit(const TopCategoryLoading([]));
      var response = await _categoryRepo.getTopCategory();
      response.fold((error) {
        emit(TopCategoryError(error.message, state.items));
      }, (data) {
        emit(TopCategoryLoaded(data.data?.items ?? []));
      });
    } catch (e) {
      emit(TopCategoryError(e.toString(), state.items));
    }
  }
}
