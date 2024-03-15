import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:timbo/repositories/address_repo/address_repo.dart';

import '../../model/address_response_model/address_response_model.dart';
import '../../model/jwt_token_response_model/jwt_token_response_model.dart';
import '../../utils/preferences/local_preferences.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final AddressRepo _addressRepo = AddressRepo();
  AddressCubit() : super(AddressInitial(AddressResponseModel()));

  void saveAddress(
    BuildContext context, {
    String? tag,
    String? streetAddress,
    String? locality,
    String? city,
    String? state,
    String? zipCode,
  }) async {
    var data = {
      "tag": tag,
      "street": streetAddress,
      "locality": locality,
      "state": state,
      "city": city,
      "zip": zipCode,
    };

    emit(AddressLoading(AddressResponseModel()));

    var user = await LocalStorage.fetchToken();
    var userData = JwtDecoder.decode(user ?? "");
    var decodedToken = JwtTokeResponseModel.fromJson(userData);
    var response = await _addressRepo.saveAddress(
        data: data, userId: decodedToken.id.toString());
    response.fold((error) {
      emit(AddressError(error.message, AddressResponseModel()));
      context.pop();
    }, (data) {
      context.pop();
      getAddress();
    });
  }

  void updateAddress(
    BuildContext context, {
    String? addressId,
    String? tag,
    String? streetAddress,
    String? locality,
    String? city,
    String? state,
    String? zipCode,
  }) async {
    var data = {
      "tag": tag,
      "street": streetAddress,
      "locality": locality,
      "state": state,
      "city": city,
      "zip": zipCode,
    };

    emit(AddressLoading(AddressResponseModel()));
    var response =
        await _addressRepo.updateAddress(data: data, addressId: addressId);
    response.fold((error) {
      emit(AddressError(error.message, AddressResponseModel()));
      context.pop();
    }, (data) {
      context.pop();
      getAddress();
    });
  }

  void setDefaultAddress(
    BuildContext context,
    String? addressId,
  ) async {
    var data = {"isdefault": true};
    emit(AddressLoading(AddressResponseModel()));
    var uId = LocalStorage.tokenResponseModel.id;
    var response = await _addressRepo.setDefaultAddress(
        data: data, addressId: addressId, userId: uId);
    response.fold((error) {
      emit(AddressError(error.message, AddressResponseModel()));
    }, (data) {
      getAddress();
    });
  }

  void getAddress() async {
    emit(AddressLoading(AddressResponseModel()));
    var uId = LocalStorage.tokenResponseModel.id;
    var response = await _addressRepo.getAddress(userId: uId);
    response.fold((error) {
      emit(AddressError(error.message, AddressResponseModel()));
    }, (data) {
      emit(AddressLoaded(data));
    });
  }

  void removeAddressById(String addressId) async {
    emit(AddressLoading(AddressResponseModel()));
    var uId = LocalStorage.tokenResponseModel.id;
    var response =
        await _addressRepo.deleteAddressById(addressId: addressId, userId: uId);
    response.fold((error) {
      emit(AddressError(error.message, AddressResponseModel()));
    }, (data) {
      getAddress();
    });
  }
}
