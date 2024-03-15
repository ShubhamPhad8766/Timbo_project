import 'package:bloc/bloc.dart';
import '../../model/top_selling_product_response_model/top_selling_product_response_model.dart';
import '../../repositories/search_product_repo/search_product_repo.dart';
part 'search_product_state.dart';

class SearchProductCubit extends Cubit<SearchProductState> {
  final SearchProductRepo _searchProductRepo = SearchProductRepo();
  SearchProductCubit() : super(const SearchProductInitial([]));

  void searchProduct(String searchQuery) async {
    try {
      emit(SearchProductLoading([]));
      var response = await _searchProductRepo.getSearchProduct(searchQuery);
      response.fold((error) {
        emit(SearchProductError(error.message, state.items));
      }, (data) {
        emit(SearchProductSuccess(data.data?.items ?? []));
      });
    } catch (e) {
      emit(SearchProductError(e.toString(), state.items));
    }
  }

  void getAllProduct() async {
    try {
      emit(SearchProductLoading([]));
      var response = await _searchProductRepo.getAllProduct();
      response.fold((error) {
        emit(SearchProductError(error.message, state.items));
      }, (data) {
        emit(SearchProductSuccess(data.data?.items ?? []));
      });
    } catch (e) {
      emit(SearchProductError(e.toString(), state.items));
    }
  }

  void clearProducts() {
    emit(SearchProductSuccess([]));
  }
}
