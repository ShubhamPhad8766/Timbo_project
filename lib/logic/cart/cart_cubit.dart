// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:timbo/constants/api_end_points.dart';
import 'package:timbo/repositories/cart/cart_repo.dart';
import 'package:timbo/utils/preferences/local_preferences.dart';

import '../../model/cart_response_model/cart_response_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo _cartRepo = CartRepo();
  CartCubit() : super(CartInitial(CartResponseModel()));

  void addToCart({String? productId}) async {
    emit(CartLoading(CartResponseModel()));
    var data = {
      "groupId": ApiEndPoints.groupId,
      "userId": LocalStorage.tokenResponseModel.id,
      "products": [
        {"productId": productId}
      ]
    };
    var response = await _cartRepo.addToCart(data);
    response.fold((error) {
      emit(CartError(CartResponseModel(), error.message));
    }, (data) {
      getCart();
    });
  }

  void getCart() async {
    emit(CartLoading(CartResponseModel()));
    var response = await _cartRepo.getCartByGroupIdAndUserId(
        groupId: ApiEndPoints.groupId,
        userId: LocalStorage.tokenResponseModel.id.toString());
    response.fold((error) {
      emit(CartError(CartResponseModel(), error.message));
    }, (data) {
      emit(CartLoaded(data));
    });
  }

  void updateCartProductById(String cartId, {List<Product>? product}) async {
    emit(QuantityLoading(CartResponseModel()));
    var data = {
      "groupId": ApiEndPoints.groupId,
      "userId": LocalStorage.tokenResponseModel.id.toString(),
      "products": product
    };
    var response = await _cartRepo.updateCartProduct(data, cartId);
    response.fold((error) {
      emit(CartError(CartResponseModel(), error.message));
    }, (data) {
      getCart();
    });
  }

  void deleteCartProductById(String cartId, String productId) async {
    log("cart id $cartId and product Id $productId");
    emit(CartLoading(CartResponseModel()));
    var response = await _cartRepo.deleteCartByProductId(
        cartId: cartId, productId: productId);
    response.fold((error) {
      emit(CartError(CartResponseModel(), error.message));
    }, (data) {
      getCart();
    });
  }
}
