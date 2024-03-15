import 'package:dartz/dartz.dart';
import 'package:timbo/services/api/failure.dart';

import '../../constants/api_end_points.dart';
import '../../model/payment_response_model/payment_response_model.dart';
import '../../services/api/api_exceptions.dart';
import '../../services/api/api_manager.dart';

class PaymentRepo {
  final _apiManager = ApiManager();

  Future<Either<Failure, PaymentResponseModel>> savePayment(
      {required Map data}) async {
    try {
      var jsonResponse = await _apiManager.post(
          "${ApiEndPoints.ecommerceBaseUrl}${ApiEndPoints.order}", data);
      var response = PaymentResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (e) {
      return left(ApiFailure(message: e.message));
    } catch (e) {
      return left(ApiFailure(message: e.toString()));
    }
  }
}
