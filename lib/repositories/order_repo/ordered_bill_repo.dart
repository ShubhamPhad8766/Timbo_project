import 'package:dartz/dartz.dart';
import 'package:timbo/constants/api_end_points.dart';
import 'package:timbo/services/api/api_manager.dart';
import 'package:timbo/services/api/failure.dart';

import '../../model/ordered_bill_response_model/ordered_bill_response_model.dart';
import '../../services/api/api_exceptions.dart';

class OrdredBillRepo {
  final ApiManager _apiManager = ApiManager();

  Future<Either<Failure, OrderedBillResponseModel>> getOrededBillData(
      int id) async {
    try {
      var jsonResponse = await _apiManager
          .get("${ApiEndPoints.ecommerceBaseUrl}${ApiEndPoints.ordergetByOrderId}$id");
      var data = OrderedBillResponseModel.fromJson(jsonResponse);
      return right(data);
    } on AppException catch (e) {
      return left(ApiFailure(message: e.toString()));
    } catch (e) {
      return left(ApiFailure(message: e.toString()));
    }
  }

  // Future<Either<Failure, dynamic>> getOrderSummaryDetails(
  //     {required userId}) async {
  //   try {
  //     var jsonResponse = await _apiManager.get(
  //         "${ApiEndPoints.getWayUrl}${ApiEndPoints.commerceGw}${ApiEndPoints.orderSummary}$userId");
  //     var response = OrderSummaryModel.fromJson(jsonResponse);
  //     return right(response);
  //   } on AppException catch (error) {
  //     return left(ApiFailure(message: error.message));
  //   } catch (error) {
  //     return left(ApiFailure(message: error.toString()));
  //   }
  // }
}
