part of 'productlist_cubit.dart';

@immutable
abstract class ProductListState {
  final TopSellingProductsResponseModel topSellingProductsResponseModel;
  const ProductListState(this.topSellingProductsResponseModel);
}

class ProductListInitial extends ProductListState {
  const ProductListInitial(super.topSellingProductsResponseModel);
}

class ProductListLoaded extends ProductListState {
  const ProductListLoaded(super.topSellingProductsResponseModel);
}

class ProductListError extends ProductListState {
  final String error;
  const ProductListError(this.error, super.topSellingProductsResponseModel);
}

class ProductListLoading extends ProductListState {
  const ProductListLoading(super.topSellingProductsResponseModel);
}
