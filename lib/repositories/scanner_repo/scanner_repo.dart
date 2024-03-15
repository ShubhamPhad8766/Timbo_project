import 'package:dartz/dartz.dart';
import 'package:timbo/constants/api_end_points.dart';
import 'package:timbo/services/api/api_exceptions.dart';
import 'package:timbo/services/api/api_manager.dart';
import 'package:timbo/services/api/failure.dart';

import '../../model/scanner_code_response_model/scanner_code_response_model.dart';

class BarCodeRepo {
  final _apiManager = ApiManager();

  Future<Either<Failure, BarCodeResponseModel>> getScannedData(String? code) async {
    try {
      var jsonData = await _apiManager.get('${ApiEndPoints.ecommerceBaseUrl}${ApiEndPoints.productByProductCode}$code');
      var jsonResponse = BarCodeResponseModel.fromJson(jsonData);
      return right(jsonResponse);
    } on AppException catch (e) {
      return left(ApiFailure(message: e.toString()));
    } catch (e) {
      return left(ApiFailure(message: e.toString()));
    }
  }
}
