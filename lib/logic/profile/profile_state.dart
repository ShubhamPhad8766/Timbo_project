// ignore_for_file: must_be_immutable

part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {
  ProfileDataResponseModel? userData;
  ProfileState({this.userData});
}

class ProfileInitial extends ProfileState {
  ProfileInitial({super.userData});
}

class ProfileLoaded extends ProfileState {
  ProfileLoaded({super.userData});
}

class ProfileLoading extends ProfileState {
  ProfileLoading({super.userData});
}

class ProfileError extends ProfileState {
  final String? errorMesage;
  ProfileError(this.errorMesage, {super.userData});
}

class LogoutState extends ProfileState {
  LogoutState({super.userData});
}
