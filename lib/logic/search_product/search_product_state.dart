part of 'search_product_cubit.dart';

// @immutable
abstract class SearchProductState {
  final List<TopSellingItem> items;
  const SearchProductState(this.items);
}

class SearchProductInitial extends SearchProductState {
  const SearchProductInitial(super.items);
}

class SearchProductSuccess extends SearchProductState {
  SearchProductSuccess(super.items);
}

class SearchProductError extends SearchProductState {
  final String? errorMessage;
  SearchProductError(this.errorMessage, super.items);
}

class SearchProductLoading extends SearchProductState {
  SearchProductLoading(super.items);
}
