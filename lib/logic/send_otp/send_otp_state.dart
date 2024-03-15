part of 'send_otp_cubit.dart';

@immutable
abstract class SendOtpState {}

class SendOtpInitial extends SendOtpState {}

class SendOtpError extends SendOtpState {
  final String? errorMessage;

  SendOtpError(this.errorMessage);
}

class SendOtpSuccess extends SendOtpState {}

class SendOtpLoading extends SendOtpState {}

