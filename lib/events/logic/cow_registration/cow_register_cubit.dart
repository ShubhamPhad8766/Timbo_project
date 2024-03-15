import 'dart:developer';

import 'package:bloc/bloc.dart';

import '../../model/cow_registration/cow_registration.dart';
import '../../repositories/competition/competition_repo.dart';
part 'cow_register_state.dart';

class CowRegisterCubit extends Cubit<CowRegisterState> {
  final CompetitionRepo _competitionRepo = CompetitionRepo();
  CowRegisterCubit() : super(CowRegisterInitial());

  getCompetition(id) async {
    try {
      emit(CowRegisterLoading());
      var response = await _competitionRepo.getCompetition(id);
      response.fold((error) {
        emit(CowRegisterError(error.message));
      }, (data) {
        emit(CowRegisterLoaded());
        log(data.toString());
      });
    } catch (e) {
      emit(CowRegisterError(e.toString()));
    }
  }

  void postCowInfo(
      {String? username,
      String? village,
      String? taluka,
      String? dist,
      String? userMobile,
      String? doctorMobile,
      String? cowCaste,
      String? milkCapacity,
      String? tagNo,
      String? condition}) async {
    var data = {
      "groupId": 1687348063136,
      "competitionId": "64f09eb2a524ac2c2be67fc0",
      "userName": username,
      "village": village,
      "taluka": taluka,
      "dist": dist,
      "custom_field": [
        {
          "user_mobile": userMobile,
          "mobile_doctor": doctorMobile,
          "cow_caste": cowCaste,
          "milk_capacity": milkCapacity,
          "tag_no": tagNo,
          "condition": condition,
        }
      ]
    };

    try {
      emit(CowRegisterLoading());
      var response = await _competitionRepo.postCowData(data);
      response.fold((error) {
        emit(CowRegisterError(error.message));
      }, (data) {
        emit(CowRegisterLoaded());
      });
    } catch (e) {
      emit(CowRegisterError(e.toString()));
    }
  }
}
