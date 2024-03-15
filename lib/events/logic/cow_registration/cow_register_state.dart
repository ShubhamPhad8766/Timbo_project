part of 'cow_register_cubit.dart';

abstract class CowRegisterState {
  CowCompetitionResponseModel? data;
  CowRegisterState({this.data});
}

class CowRegisterInitial extends CowRegisterState {
  CowRegisterInitial({super.data});
}

class CowRegisterLoading extends CowRegisterState {
  CowRegisterLoading({super.data});
}

class CowRegisterError extends CowRegisterState {
  final String? errorMesage;
  CowRegisterError(this.errorMesage, {super.data});
}

class CowRegisterLoaded extends CowRegisterState {
  CowRegisterLoaded({super.data});
}
