import 'package:dartz/dartz.dart';

import '../../constants/api_end_points.dart';
import '../../model/promotions_response_model/promotion_response_model.dart';
import '../../services/api/api_exceptions.dart';
import '../../services/api/api_manager.dart';
import '../../services/api/failure.dart';

class PromotionsRepo {
  final _apiManager = ApiManager();

  Future<Either<Failure, PromotionResponseModel>> getPromotionsBanners() async {
    try {
      var jsonResponse = await _apiManager.get(
        "${ApiEndPoints.ecommerceBaseUrl}${ApiEndPoints.promotion}",
      );
      var response = PromotionResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }
}
