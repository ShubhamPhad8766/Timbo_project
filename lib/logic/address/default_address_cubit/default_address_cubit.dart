import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:timbo/model/address_response_model/default_address_response_model.dart';
import 'package:timbo/repositories/address_repo/address_repo.dart';

import '../../../utils/preferences/local_preferences.dart';
part 'default_address_state.dart';

class DefaultAddressCubit extends Cubit<DefaultAddressState> {
  final AddressRepo _addressRepo = AddressRepo();
  DefaultAddressCubit() : super(DefaultAddressInitial(DefaultAddressResponseModel()));

  // void setDefaultAddress(
  //   BuildContext context,
  //   String? addressId,
  // ) async {
  //   var data = {"isdefault": true};
  //   emit(AddressLoading(AddressResponseModel()));
  //   var uId = LocalStorage.tokenResponseModel.id;
  //   var response = await _addressRepo.setDefaultAddress(
  //       data: data, addressId: addressId, userId: uId);
  //   response.fold((error) {
  //     emit(AddressError(error.message, AddressResponseModel()));
  //     log(error.message);
  //   }, (data) {
  //     getAddress();
  //   });
  // }

  void getDefaultAddress() async {
    emit(DefaultAddressLoading(DefaultAddressResponseModel()));
    var uId = LocalStorage.tokenResponseModel.id;
    var response = await _addressRepo.getDefaultAddress(userId: uId);
    response.fold((error) {
      emit(DefaultAddressError(error.message, DefaultAddressResponseModel()));
    }, (data) {
      emit(DefaultAddressLoaded(data));
    });
  }
}
