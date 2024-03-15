import 'package:dartz/dartz.dart';
import 'package:timbo/constants/api_end_points.dart';
import 'package:timbo/model/order_models/my_order_response_model/my_order_response_model.dart';
import 'package:timbo/services/api/api_exceptions.dart';
import 'package:timbo/services/api/api_manager.dart';
import 'package:timbo/services/api/failure.dart';

class MyOrderRepo {
  final _apiManger = ApiManager();
  Future<Either<ApiFailure, MyOrderResponseModel>> getMyOrders(
      String? userId) async {
    try {
      var json = await _apiManger.get(
          "${ApiEndPoints.ecommerceBaseUrl}${ApiEndPoints.orderGetByuserId}$userId");
      var jsonResponse = MyOrderResponseModel.fromJson(json);
      return right(jsonResponse);
    } on AppException catch (e) {
      return left(ApiFailure(message: e.toString()));
    } catch (e) {
      return left(ApiFailure(message: e.toString()));
    }
  }
}
