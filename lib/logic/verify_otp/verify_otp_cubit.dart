// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import 'package:timbo/utils/preferences/local_preferences.dart';

import '../../repositories/auth/auth_repo.dart';

part 'verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  final AuthRepo _authRepo = AuthRepo();
  VerifyOtpCubit() : super(VerifyOtpInitial());

  void verifyOtp({required String phoneNumber, int? otp}) async {
    var data = {"phoneNumber": phoneNumber, "otp": otp};
    emit(VerifyOtpLoading());
    var response = await _authRepo.verifyOtp(data: data);
    response.fold((error) {
      emit(VerifyOtpError(error.message));
    }, (data) {
      emit(VerifyOtpSuccess());
      if (data.data?.userExits != true) {
        emit(VerifyOtpUserNotExists(phoneNumber: phoneNumber));
      } else {
        LocalStorage.saveUserDetails(data.token ?? "");

        emit(UserLoggedIn());
      }
    });
  }
}
