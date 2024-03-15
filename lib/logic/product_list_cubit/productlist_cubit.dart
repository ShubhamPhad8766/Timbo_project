// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/top_selling_product_response_model/top_selling_product_response_model.dart';
import '../../repositories/product_repo/product_repo.dart';

part 'productlist_state.dart';

class ProductListCubit extends Cubit<ProductListState> {
  final ProductRepo _productRepo = ProductRepo();
  ProductListCubit()
      : super(ProductListInitial(TopSellingProductsResponseModel()));

  void getProductByCategoryId(String? id) async {
    try {
      emit(ProductListLoading(TopSellingProductsResponseModel()));
      var response = await _productRepo.getProductsByCategoryId(id);
      response.fold((error) {
        emit(ProductListError(
            error.message, state.topSellingProductsResponseModel));
      }, (data) {
        emit(ProductListLoaded(data));
      });
    } catch (e) {
      emit(ProductListError(
          e.toString(), state.topSellingProductsResponseModel));
    }
  }
}
