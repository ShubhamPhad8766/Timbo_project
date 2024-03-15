part of 'personal_info_cubit.dart';

@immutable
abstract class PersonalInfoState {}

class PersonalInfoInitial extends PersonalInfoState {}

class SignUpError extends PersonalInfoState {
  final String error;
  SignUpError(this.error);
}

class PersonalInfoError extends PersonalInfoState {
  final String error;
  PersonalInfoError(this.error);
}

class PersonalInfoLoading extends PersonalInfoState {}

class PersonalInfoSuccess extends PersonalInfoState {}
