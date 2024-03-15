import 'package:dartz/dartz.dart';

import '../../constants/api_end_points.dart';
import '../../model/get_all_product_response_model/get_all_product_response_model.dart';
import '../../model/top_selling_product_response_model/top_selling_product_response_model.dart';
import '../../services/api/api_exceptions.dart';
import '../../services/api/api_manager.dart';
import '../../services/api/failure.dart';

class ProductRepo {
  final _apiManager = ApiManager();

  Future<Either<Failure, TopSellingProductsResponseModel>>
      getTopSellingProductsBanners() async {
    try {
      var jsonResponse = await _apiManager.get(
        "${ApiEndPoints.ecommerceBaseUrl}${ApiEndPoints.topSelling}",
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
      getProductsByCategoryId(String? id) async {
    try {
      var jsonResponse = await _apiManager.get(
        "${ApiEndPoints.ecommerceBaseUrl}${ApiEndPoints.productByCategoryId}$id",
      );
      var response = TopSellingProductsResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, ProductListResponseModel>>
      getAllProducts(String? id) async {
    try {
      var jsonResponse = await _apiManager.get(
        "${ApiEndPoints.ecommerceBaseUrl}${ApiEndPoints.productAllProduct}",
      );
      var response = ProductListResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }
}
