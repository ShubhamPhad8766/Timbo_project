// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:timbo/model/promotions_response_model/promotion_response_model.dart';

import '../../repositories/promotion_repo/promotions_repo.dart';

part 'promotion_state.dart';

class PromotionCubit extends Cubit<PromotionState> {
  final PromotionsRepo _promotionsRepo = PromotionsRepo();
  PromotionCubit() : super(PromotionInitial(const [])) {
    getPromotionBanners();
  }

  void getPromotionBanners() async {
    try {
      emit(PromotionLoading(const []));
      var response = await _promotionsRepo.getPromotionsBanners();
      response.fold((error) {
        emit(PromotionError(error.message, state.bannerImages));
      }, (data) {
        emit(PromotionLoaded(data.data?.items ?? []));
      });
    } catch (e) {
      emit(PromotionError(e.toString(), state.bannerImages));
    }
  }
}
