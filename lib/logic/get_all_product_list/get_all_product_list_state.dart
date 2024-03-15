part of 'get_all_product_list_cubit.dart';

// @immutable
abstract class GetAllProductState {
  final List<TopSellingItem> items;
  const GetAllProductState(this.items);
}

class GetAllProductInitial extends GetAllProductState {
  const GetAllProductInitial(super.items);
}

class GetAllProductSuccess extends GetAllProductState {
  GetAllProductSuccess(super.items);
}

class GetAllProductError extends GetAllProductState {
  final String? errorMessage;
  GetAllProductError(this.errorMessage, super.items);
}

class GetAllProductLoading extends GetAllProductState {
  GetAllProductLoading(super.items);
}
