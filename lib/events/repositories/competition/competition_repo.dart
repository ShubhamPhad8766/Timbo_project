import 'package:dartz/dartz.dart';

import '../../../constants/api_end_points.dart';
import '../../../services/api/api_exceptions.dart';
import '../../../services/api/api_manager.dart';
import '../../../services/api/failure.dart';
import '../../model/calf_competition/calf_competition.dart';
import '../../model/cow_registration/cow_registraion_response_model.dart';
import '../../model/cow_registration/cow_registration.dart';

class CompetitionRepo {
  final _apiManager = ApiManager();

  Future<Either<Failure, CowCompetitionResponseModel>> getCompetition(
      id) async {
    try {
      var jsonResponse = await _apiManager.get(
          "${ApiEndPoints.eventBaseUrl}${ApiEndPoints.cowCompetition}$id");
      var response = CowCompetitionResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, CalfCompetitionResponseModel>>
      getCalfCompetition() async {
    try {
      var jsonResponse = await _apiManager
          .get("${ApiEndPoints.eventBaseUrl}${ApiEndPoints.cowCompetition}");
      var response = CalfCompetitionResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, CowRegistrationResponseModel>> postCowData(
      Map<String, dynamic> data) async {
    try {
      var jsonResponse = await _apiManager.post(
          '${ApiEndPoints.ecommerceBaseUrl}competitionparticipants',
          data);

      var response = CowRegistrationResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }
}
