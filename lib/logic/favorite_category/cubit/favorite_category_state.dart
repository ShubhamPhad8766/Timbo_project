part of 'favorite_category_cubit.dart';

@immutable
abstract class FavoriteCategoryState {
  final List<FavoriteItem> items;
  const FavoriteCategoryState(this.items);
}

class FavoriteCategoryInitial extends FavoriteCategoryState {
  FavoriteCategoryInitial() : super([]);
}

class FavoriteCategoryLoading extends FavoriteCategoryState {
  const FavoriteCategoryLoading(super.items);
}

class FavoriteCategoryLoaded extends FavoriteCategoryState {
  const FavoriteCategoryLoaded(super.items);
}

class FavoriteCategoryError extends FavoriteCategoryState {
  final String? errorMesage;

  const FavoriteCategoryError(this.errorMesage, super.items);
}
