part of 'top_category_cubit.dart';

@immutable
abstract class TopCategoryState {
  final List<CategoryItem>? items;
  const TopCategoryState(this.items);
}

class TopCategoryInitial extends TopCategoryState {
  const TopCategoryInitial(super.items);
}

class TopCategoryLoading extends TopCategoryState {
  const TopCategoryLoading(super.items);
}

class TopCategoryLoaded extends TopCategoryState {
  const TopCategoryLoaded(super.items);
}

class TopCategoryError extends TopCategoryState {
  final String error;
  const TopCategoryError(this.error, super.items);
}
