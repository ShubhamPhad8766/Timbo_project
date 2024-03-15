// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:timbo/repositories/product_repo/product_repo.dart';

import '../../model/top_selling_product_response_model/top_selling_product_response_model.dart';

part 'top_selling_state.dart';

class TopSellingCubit extends Cubit<TopSellingState> {
  final ProductRepo _productRepo = ProductRepo();
  TopSellingCubit() : super(const TopSellingInitial([])) {
    getTopSellingProducts();
  }

  void getTopSellingProducts() async {
    try {
      emit(const TopSellingLoading([]));
      var response = await _productRepo.getTopSellingProductsBanners();
      response.fold((error) {
        emit(TopSellingError(error.message, state.items));
      }, (data) {
        emit(TopSellingLoaded(data.data?.items ?? []));
      });
    } catch (e) {
      emit(TopSellingError(e.toString(), state.items));
    }
  }
}
