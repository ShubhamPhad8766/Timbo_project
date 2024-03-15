import 'package:bloc/bloc.dart';
import '../../model/top_selling_product_response_model/top_selling_product_response_model.dart';
import '../../repositories/search_product_repo/search_product_repo.dart';
part 'get_all_product_list_state.dart';

class GetAllProductCubit extends Cubit<GetAllProductState> {
  final SearchProductRepo _searchProductRepo = SearchProductRepo();
  GetAllProductCubit() : super(const GetAllProductInitial([]));


  void getAllProduct() async {
    try {
      emit(GetAllProductLoading([]));
      var response = await _searchProductRepo.getAllProduct();
      response.fold((error) {
        emit(GetAllProductError(error.message, state.items));
      }, (data) {
        emit(GetAllProductSuccess(data.data?.items ?? []));
      });
    } catch (e) {
      emit(GetAllProductError(e.toString(), state.items));
    }
  }

  void clearProducts() {
    emit(GetAllProductSuccess([]));
  }
}
