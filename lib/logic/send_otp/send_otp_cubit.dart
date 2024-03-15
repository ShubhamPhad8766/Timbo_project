// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../repositories/auth/auth_repo.dart';

part 'send_otp_state.dart';

class SendOtpCubit extends Cubit<SendOtpState> {
  final AuthRepo _authRepo = AuthRepo();

  SendOtpCubit() : super(SendOtpInitial());

  void sendOtp(String number) async {
    var data = {
      "phoneNumber": number,
    };
    try {
      emit(SendOtpLoading());
      var response = await _authRepo.verifyNumber(data: data);
      response.fold((error) {
        emit(SendOtpError(error.message));
      }, (data) {
        emit(SendOtpSuccess());
      });
    } catch (e) {
      emit(SendOtpError(e.toString()));
    }
  }
}
