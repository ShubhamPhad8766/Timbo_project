part of 'default_address_cubit.dart';


@immutable
abstract class DefaultAddressState {
  final DefaultAddressResponseModel defaultAddressResponseModel;
  const DefaultAddressState(this.defaultAddressResponseModel);
}

class DefaultAddressInitial extends DefaultAddressState {
  const DefaultAddressInitial(super.defaultAddressResponseModel);
}

class DefaultAddressLoading extends DefaultAddressState {
  const DefaultAddressLoading(super.defaultAddressResponseModel);
}

class DefaultAddressLoaded extends DefaultAddressState {
  const DefaultAddressLoaded(super.defaultAddressResponseModel);
}

class DefaultAddressError extends DefaultAddressState {
  final String error;
  const DefaultAddressError(
    this.error,
    super.defaultAddressResponseModel,
  );
}
