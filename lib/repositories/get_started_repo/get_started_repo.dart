import 'package:dartz/dartz.dart';

import '../../constants/api_end_points.dart';
import '../../model/get_started_response_model.dart';
import '../../services/api/api_exceptions.dart';
import '../../services/api/api_manager.dart';
import '../../services/api/failure.dart';

class GetStartedRepo {
  final _apiManager = ApiManager();

  Future<Either<Failure, GetStartedResponseModel>> getBanners(
      {required String groupId}) async {
    try {
      var jsonResponse = await _apiManager.get(
        "${ApiEndPoints.baseUrl}${ApiEndPoints.group}/$groupId",
      );
      var response = GetStartedResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }
}
