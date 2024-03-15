part of 'address_cubit.dart';

@immutable
abstract class AddressState {
  final AddressResponseModel addressResponseModel;
  const AddressState(this.addressResponseModel);
}

class AddressInitial extends AddressState {
  const AddressInitial(super.addressResponseModel);
}

class AddressLoading extends AddressState {
  const AddressLoading(super.addressResponseModel);
}

class AddressLoaded extends AddressState {
  const AddressLoaded(super.addressResponseModel);
}

class AddressError extends AddressState {
  final String error;
  const AddressError(
    this.error,
    super.addressResponseModel,
  );
}
