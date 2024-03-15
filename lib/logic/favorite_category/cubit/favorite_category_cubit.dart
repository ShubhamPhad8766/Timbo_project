// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/favorite_category_response_model/favorite_category_response_model.dart';
import '../../../repositories/category_repo/category_repo.dart';

part 'favorite_category_state.dart';

class FavoriteCategoryCubit extends Cubit<FavoriteCategoryState> {
  final CategoryRepo _categoryRepo = CategoryRepo();
  FavoriteCategoryCubit() : super(FavoriteCategoryInitial()) {
    getFavoriteCategory();
  }

  void getFavoriteCategory() async {
    try {
      emit(FavoriteCategoryLoading(state.items));
      var response =
          await _categoryRepo.getfavroiteCategory(groupId: "1687348063136");
      response.fold((error) {
        emit(FavoriteCategoryError(error.message, state.items));
      }, (data) {
        emit(FavoriteCategoryLoaded(data.data?.items ?? []));
      });
    } catch (e) {
      emit(FavoriteCategoryError(e.toString(), state.items));
    }
  }

  void setSelected(bool value, int index) {
    state.items[index].isSelected = !value;
    emit(FavoriteCategoryLoaded(state.items));
  }
}
