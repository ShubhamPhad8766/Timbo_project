import 'package:dartz/dartz.dart';
import 'package:timbo/model/company_details_response_model/company_details_response_model.dart';
import '../../constants/api_end_points.dart';
import '../../services/api/api_exceptions.dart';
import '../../services/api/api_manager.dart';
import '../../services/api/failure.dart';

class CompanyRepo {
  final _apiManager = ApiManager();

  Future<Either<Failure, dynamic>> saveCompanyDetails(
      {required Map data}) async {
    try {
      var jsonResponse = await _apiManager.post(
          ApiEndPoints.baseUrl + ApiEndPoints.group + ApiEndPoints.companyDetails,
          data);

      var response = CompanyDetailsResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }
}
