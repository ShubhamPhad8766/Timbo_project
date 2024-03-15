import 'package:dartz/dartz.dart';
import 'package:timbo/services/api/api_exceptions.dart';

import '../../constants/api_end_points.dart';
import '../../model/profile_response_model/profile_response_model.dart';
import '../../model/sign_up_response_model/sign_up_response_model.dart';
import '../../model/verification_response_model/verification_response_model.dart';
import '../../services/api/api_manager.dart';
import '../../services/api/failure.dart';

class AuthRepo {
  final _apiManager = ApiManager();

  Future<Either<Failure, VerificationResponseModel>> verifyNumber(
      {required Map data}) async {
    try {
      var jsonResponse = await _apiManager.post(
          "${ApiEndPoints.getWayUrl}${ApiEndPoints.authGw}${ApiEndPoints.sendOtpWhatsAPP}",
          data);
      var response = VerificationResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, VerificationResponseModel>> verifyOtp(
      {required Map data}) async {
    try {
      var jsonResponse = await _apiManager.post(
        "${ApiEndPoints.baseUrl}${ApiEndPoints.auth}${ApiEndPoints.verifyOtp}",
          data);
      var response = VerificationResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, SignUpResponseModel>> signUp(
      {required Map data}) async {
    try {
      var jsonResponse = await _apiManager.post(
          "${ApiEndPoints.baseUrl}${ApiEndPoints.auth}${ApiEndPoints.signUp}",
          data);
      var response = SignUpResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, SignUpResponseModel>> saveUserProfile(String id,
      {required Map data}) async {
    try {
      var jsonResponse = await _apiManager.post(
          "${ApiEndPoints.baseUrl}${ApiEndPoints.saveUserProfile}$id", data);
      var response = SignUpResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }


  Future<Either<Failure, ProfileDataResponseModel>> getUserProfileData(
      String id) async {
    try {
      var jsonResponse = await _apiManager
          .get("${ApiEndPoints.baseUrl}${ApiEndPoints.user}/$id");
      var response = ProfileDataResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, ProfileDataResponseModel>> updateUserProfileData(
      String id, Map<String, dynamic> data) async {
    try {
      var jsonResponse = await _apiManager.put(
          "${ApiEndPoints.baseUrl}${ApiEndPoints.user}/$id", data);
      var response = ProfileDataResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }
}
