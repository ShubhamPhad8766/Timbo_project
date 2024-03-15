import 'package:dartz/dartz.dart';
import '../../constants/api_end_points.dart';
import '../../model/cart_response_model/add_to_cart_response_model.dart';
import '../../model/cart_response_model/cart_response_model.dart';
import '../../services/api/api_exceptions.dart';
import '../../services/api/api_manager.dart';
import '../../services/api/failure.dart';

class CartRepo {
  final _apiManager = ApiManager();

  Future<Either<Failure, CartResponseModel>> getCartByGroupIdAndUserId(
      {required String groupId, required String userId}) async {
    try {
      var jsonResponse = await _apiManager.get(
          "${ApiEndPoints.ecommerceBaseUrl}${ApiEndPoints.getCartByGroupIdAndUserId}$groupId/$userId");
      var response = CartResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, AddToCartResponseModel>> addToCart(
      Map<String, Object?> data) async {
    try {
      var jsonResponse = await _apiManager.post(
          "${ApiEndPoints.ecommerceBaseUrl}${ApiEndPoints.cart}", data);
      var response = AddToCartResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, CartResponseModel>> updateCartProduct(
      Map<String, Object?> data,String cartId) async {
    try {
      var jsonResponse = await _apiManager.put(
          "${ApiEndPoints.ecommerceBaseUrl}${ApiEndPoints.cart}$cartId", data);
      var response = CartResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, dynamic>> deleteCartByProductId(
  {String? cartId,String? productId}) async {
    try {
      var jsonResponse = await _apiManager.delete(
          "${ApiEndPoints.ecommerceBaseUrl}${ApiEndPoints.cart}${"product/$cartId/$productId"}");
      var response = AddToCartResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }
}
