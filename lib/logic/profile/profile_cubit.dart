// ignore_for_file: depend_on_referenced_packages, unnecessary_import

import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:meta/meta.dart';
import 'package:timbo/repositories/auth/auth_repo.dart';

import '../../model/jwt_token_response_model/jwt_token_response_model.dart';
import '../../model/profile_response_model/profile_response_model.dart';
import '../../utils/preferences/local_preferences.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final AuthRepo _authRepo = AuthRepo();
  ProfileCubit() : super(ProfileInitial()) {
    getUserProfileData();
  }

  void signOut(BuildContext context) async {
    emit(LogoutState());
    await LocalStorage.instance.clear();
    log(await LocalStorage.fetchToken() ?? "");
  }

  void getUserProfileData() async {
    try {
      emit(ProfileLoading());
      var user = await LocalStorage.fetchToken();
      var userData = JwtDecoder.decode(user ?? "");
      var decodedToken = JwtTokeResponseModel.fromJson(userData);
      var response =
          await _authRepo.getUserProfileData(decodedToken.id.toString());
      response.fold((error) {
        emit(ProfileError(error.message));
      }, (data) {
        emit(ProfileLoaded(userData: data));
      });
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  void updateUserProfile(String name,String? imageUrl) async {
    var user = await LocalStorage.fetchToken();
    var userData = JwtDecoder.decode(user ?? "");
    var decodedToken = JwtTokeResponseModel.fromJson(userData);
    var data = {
      "name": name,
      "imageUrl": imageUrl,
    };
    try {
      emit(ProfileLoading());
      var response = await _authRepo.updateUserProfileData(
          decodedToken.id.toString(), data);
      response.fold((error) {
        emit(ProfileError(error.message));
      }, (data) {
        emit(ProfileLoaded(userData: data));
      });
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
