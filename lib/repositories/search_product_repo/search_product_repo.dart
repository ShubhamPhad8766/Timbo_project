import 'package:dartz/dartz.dart';
import 'package:timbo/model/top_selling_product_response_model/top_selling_product_response_model.dart';

import '../../constants/api_end_points.dart';
import '../../services/api/api_exceptions.dart';
import '../../services/api/api_manager.dart';
import '../../services/api/failure.dart';

class SearchProductRepo {
  final _apiManager = ApiManager();

  Future<Either<Failure, TopSellingProductsResponseModel>> getSearchProduct(
      String searchQuery) async {
    try {
      var jsonResponse = await _apiManager.get(
        "${ApiEndPoints.ecommerceBaseUrl}${ApiEndPoints.searchProcutByname}$searchQuery",
      );
      var response = TopSellingProductsResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, TopSellingProductsResponseModel>>
      getAllProduct() async {
    try {
      var jsonResponse = await _apiManager.get(
        "${ApiEndPoints.ecommerceBaseUrl}${ApiEndPoints.productAllProduct}",
      );
      var response = TopSellingProductsResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }
}
