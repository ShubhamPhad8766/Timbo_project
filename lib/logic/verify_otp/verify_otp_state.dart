part of 'verify_otp_cubit.dart';

@immutable
abstract class VerifyOtpState {}

class VerifyOtpInitial extends VerifyOtpState {}

class VerifyOtpSuccess extends VerifyOtpState {}

class VerifyOtpLoading extends VerifyOtpState {}

class VerifyOtpError extends VerifyOtpState {
  final String? errorMesage;

  VerifyOtpError(this.errorMesage);
}

class VerifyOtpUserExists extends VerifyOtpState {}

class VerifyOtpUserNotExists extends VerifyOtpState {
  final String phoneNumber;
  VerifyOtpUserNotExists({required this.phoneNumber});
}

class UserLoggedIn extends VerifyOtpState {
  UserLoggedIn();
}

class UserLoggedOut extends VerifyOtpState {}
