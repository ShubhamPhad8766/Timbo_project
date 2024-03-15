import 'package:dartz/dartz.dart';
import 'package:timbo/constants/api_end_points.dart';
import 'package:timbo/services/api/api_manager.dart';
import 'package:timbo/services/api/failure.dart';

import '../../model/image_upload_response_model/image_upload_response_model.dart';
import '../../services/api/api_exceptions.dart';

class ImageUplaodRepo {
  // final _apiManager = ApiManager();

  // Future<Either<Failure, ImageUploadResponseModel>> uploadImage(
  //     String? imageName, String? imageType) async {
  //   try {
  //     var jsonResponse = await _apiManager.get(
  //         '${ApiEndPoints.imageUploadBaseUrl}${ApiEndPoints.imageUpload}?fileName=$imageName&fileType=$imageType');
  //     var response = ImageUploadResponseModel.fromJson(jsonResponse);
  //     return right(response);
  //   } on AppException catch (e) {
  //     return left(ApiFailure(message: e.message));
  //   } catch (e) {
  //     return left(ApiFailure(message: e.toString()));
  //   }
  // }

  final _apiManager = ApiManager();

  Future<Either<Failure, ImageUploadResponseModel>> uploadImage(
      String? imageName, String? imageType) async {
    try {
      var jsonResponse = await _apiManager.get(
        "${ApiEndPoints.imageUploadBaseUrl}${ApiEndPoints.imageUpload}?fileName=$imageName&fileType=$imageType",
      );
      var response = ImageUploadResponseModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }
}
