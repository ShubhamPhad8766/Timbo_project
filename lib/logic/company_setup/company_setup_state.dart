part of 'company_setup_cubit.dart';

@immutable
abstract class CompanySetupState {}

class CompanySetupInitial extends CompanySetupState {}

class CompanySetupSuccess extends CompanySetupState {}

class CompanySetupLoading extends CompanySetupState {}

class CompanySetupError extends CompanySetupState {
  final String error;
  CompanySetupError(this.error);
}
