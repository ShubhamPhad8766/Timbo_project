import 'package:dartz/dartz.dart';
import 'package:timbo/model/order_summary_response_model/order_summary_response_model.dart';

import '../../constants/api_end_points.dart';
import '../../services/api/api_exceptions.dart';
import '../../services/api/api_manager.dart';
import '../../services/api/failure.dart';

class OrderSummaryRepo {
  final _apiManager = ApiManager();

  Future<Either<Failure, dynamic>> getOrderSummaryDetails(
      {required userId}) async {
    try {
      var jsonResponse = await _apiManager.get(
          "${ApiEndPoints.getWayUrl}${ApiEndPoints.commerceGw}${ApiEndPoints.orderSummary}$userId");
      var response = OrderSummaryModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }
}
