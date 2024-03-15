import 'package:dartz/dartz.dart';

import '../../constants/api_end_points.dart';
import '../../model/favorite_category_response_model/favorite_category_response_model.dart';
import '../../model/top_category_response_model/top_category_response_model.dart';
import '../../services/api/api_exceptions.dart';
import '../../services/api/api_manager.dart';
import '../../services/api/failure.dart';

class CategoryRepo {
  final _apiManager = ApiManager();

  Future<Either<Failure, FavoriteCategoryResponseModel>> getfavroiteCategory(
      {required String groupId}) async {
    try {
      var jsonResponse = await _apiManager.get(
          "${ApiEndPoints.ecommerceBaseUrl}${ApiEndPoints.category}all/getByGroupId/$groupId");
      var response = FavoriteCategoryResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, TopCateogryResponseModel>>
      getTopCategory() async {
    try {
      var jsonResponse = await _apiManager
          .get("${ApiEndPoints.ecommerceBaseUrl}${ApiEndPoints.topCategory}");
      var response = TopCateogryResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }
}
