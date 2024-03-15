// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:timbo/constants/app_strings.dart';
import 'package:timbo/utils/app_utils/snackbar/snackbar.dart';

import '../../repositories/image_upload_repo/image_upload_repo.dart';
import '../../services/api/api_manager.dart';

part 'image_upload_state.dart';

class ImageUploadCubit extends Cubit<ImageUploadState> {
  final ImageUplaodRepo _imageRepo = ImageUplaodRepo();
  ImageUploadCubit() : super(ImageUploadInitial());

  void getImageUrl({
    String? imageName,
    String? imageType,
    Uint8List? bytes,
  }) async {
    emit(ImageUploadLoading());
    var response = await _imageRepo.uploadImage(imageName, imageType);
    response.fold((error) {
      log(error.message);
      emit(ImageUploadError(error.message));
    }, (data) {
      uploadImage(data, imageType, bytes);
    });
  }

  void uploadImage(data, fileType, fileDataBinary) async {
    var url = Uri.parse(data.uploadUrl?.split("?").first ?? "");
    log("$url.....................................................");
    var response = await ApiManager().dioPutFile(
        uploadFile: XFile.fromData(fileDataBinary!),
        url: data.uploadUrl!,
        contentType: fileType,
        fileLength: fileDataBinary!.length);
    log(response ?? "");
    emit(ImageUploadSuccess(url.toString()));
  }

  Future<void> captureAndUploadImage(BuildContext context) async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    if (pickedFile != null) {
      try {
        final filePath = File(pickedFile.path);
        final bytes = pickedFile.readAsBytes();
        final mimeType = lookupMimeType(pickedFile.path);
        log("$bytes ............................... readAsBytes");
        log("$filePath ............................... filePath");
        log("$mimeType ............................... mimeType");
        getImageUrl(
          imageType: mimeType,
          imageName: filePath.toString(),
          bytes: await bytes,
        );
      } catch (e) {
        log(e.toString());
      }
    } else {
      Navigator.pop(context);
      SnackBarWidget.showSnackbar(context, AppStrings.notselectFile);
    }
  }

  void clearData() {
    log("clear Image");
    emit(ImageUploadSuccess(""));
  }

  Future<void> pickImage(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      withData: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
    );
    if (result != null) {
      try {
        final image = result.files.single.name;
        final bytes = result.files.single.bytes;
        final imageType = lookupMimeType(result.files.single.name);
        if (image != '' && imageType != null) {
          // emit(result.files.single.path as ImageUploadState);
          getImageUrl(imageName: image, imageType: imageType, bytes: bytes);
          Navigator.pop(context);
        }
      } catch (e) {
        log(e.toString());
      }
    } else {
      Navigator.pop(context);
      SnackBarWidget.showSnackbar(context, AppStrings.notselectFile);
    }
  }
}
