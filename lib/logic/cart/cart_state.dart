part of 'cart_cubit.dart';

@immutable
abstract class CartState extends Equatable {
  final CartResponseModel? data;
  const CartState(this.data);
}

class CartInitial extends CartState {
  const CartInitial(super.cartResponseModel);

  @override

  List<Object?> get props => [];
}

class CartLoading extends CartState {
 const  CartLoading(super.cartResponseModel);

  @override

  List<Object?> get props => [];
}

class CartLoaded extends CartState {
  const CartLoaded(super.cartResponseModel);

  @override

  List<Object?> get props => [super.data];
}

class CartError extends CartState {
  final String error;
  const CartError(super.cartResponseModel, this.error);

  @override

  List<Object?> get props => [];
}

class CartQuantityIncrement extends CartState{
  final int? value;
  const CartQuantityIncrement(super.cartResponseModel,this.value);

  @override

  List<Object?> get props => [];

}

class CartQuantityDecrement extends CartState{
   final int value;
  const CartQuantityDecrement(super.cartResponseModel,this.value);

  @override

  List<Object?> get props => [];
}

class QuantityLoading extends CartState{
  const QuantityLoading(super.cartResponseModel);

  @override

  List<Object?> get props => [];
}
