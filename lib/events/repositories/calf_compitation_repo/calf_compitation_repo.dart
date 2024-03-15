import 'package:dartz/dartz.dart';

import '../../../constants/api_end_points.dart';
import '../../../services/api/api_exceptions.dart';
import '../../../services/api/api_manager.dart';
import '../../../services/api/failure.dart';
import '../../model/calf_competition/calf_competition.dart';
import '../../model/calf_competition/calf_registration_resposnse_model.dart';

class CalfCompetitionRepo {
  final _apiManager = ApiManager();

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

  Future<Either<Failure, CalfRegistrationResponseModel>> postCalfData(
      Map<String, dynamic> data) async {
    try {
      var jsonResponse = await _apiManager.post(
          '${ApiEndPoints.eventBaseUrl}competitionparticipants', data);
      var response = CalfRegistrationResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }
}
