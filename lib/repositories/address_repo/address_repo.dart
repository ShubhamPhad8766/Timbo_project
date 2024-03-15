import 'package:dartz/dartz.dart';
import 'package:timbo/model/address_response_model/address_response_model.dart';

import '../../constants/api_end_points.dart';
import '../../model/address_response_model/add_address_response_model.dart';
import '../../model/address_response_model/default_address_response_model.dart';
import '../../model/address_response_model/delete_address_response_model.dart';
import '../../services/api/api_exceptions.dart';
import '../../services/api/api_manager.dart';
import '../../services/api/failure.dart';

class AddressRepo {
  final _apiManager = ApiManager();

  Future<Either<Failure, dynamic>> saveAddress(
      {required userId, required Map data}) async {
    try {
      var jsonResponse = await _apiManager.post(
          ApiEndPoints.baseUrl + ApiEndPoints.saveUserAddress + userId, data);
      var response = AddAddressResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, dynamic>> getAddress({required userId}) async {
    try {
      var jsonResponse = await _apiManager
          .get("${ApiEndPoints.baseUrl}${ApiEndPoints.userDetails}$userId");
      var response = AddressResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }
  
  Future<Either<Failure, dynamic>> getDefaultAddress({required userId}) async {
    try {
      var jsonResponse = await _apiManager
          .get("${ApiEndPoints.baseUrl}${ApiEndPoints.getDefaultUserAddress}$userId/true");
      var response = DefaultAddressResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, dynamic>> updateAddress(
      {required addressId, required Map data}) async {
    try {
      var jsonResponse = await _apiManager.put(
          ApiEndPoints.baseUrl + ApiEndPoints.updateUserAddress + addressId,
          data);
      var response = DeleteAddressResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, dynamic>> setDefaultAddress(
      {required addressId, required userId, required Map data}) async {
    try {
      var jsonResponse = await _apiManager.put(
          "${ApiEndPoints.baseUrl}${ApiEndPoints.setDefaultUserAddress}$userId/address/$addressId",
          data);
      var response = DeleteAddressResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, dynamic>> deleteAddressById(
      {String? addressId, String? userId}) async {
    try {
      var jsonResponse = await _apiManager.delete(
          "${ApiEndPoints.baseUrl}${ApiEndPoints.deleteUserAddress}$userId/$addressId");
      var response = DeleteAddressResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }
}
