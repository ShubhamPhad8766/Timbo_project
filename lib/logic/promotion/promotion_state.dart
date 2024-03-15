// ignore_for_file: must_be_immutable

part of 'promotion_cubit.dart';

@immutable
abstract class PromotionState {
  List<PromotionItem>? bannerImages = [];
  PromotionState(this.bannerImages);
}

class PromotionInitial extends PromotionState {
  PromotionInitial(super.bannerImages);
}

class PromotionError extends PromotionState {
  final String error;
  PromotionError(this.error, super.bannerImages);
}

class PromotionLoading extends PromotionState {
 
  PromotionLoading(super.bannerImages);
}

class PromotionLoaded extends PromotionState {
  PromotionLoaded(super.bannerImages);
}
