import 'package:bloc/bloc.dart';

import '../../model/calf_competition/calf_competition.dart';
import '../../repositories/calf_compitation_repo/calf_compitation_repo.dart';

part 'calf_competition_state.dart';

class CalfCompetitionCubit extends Cubit<CalfCompetitionState> {
  final CalfCompetitionRepo _calfCompetitionRepo = CalfCompetitionRepo();
  CalfCompetitionCubit() : super(CalfCompetitionInitial());

  // getCompetition() async {
  //   try {
  //     emit(CalfCompetitionLoading());
  //     var response = await _calfCompetitionRepo.getCalfCompetition();
  //     response.fold((error) {
  //       emit(CalfCompetitionError(error.message));
  //     }, (data) {
  //       emit(CalfCompetitionLoaded());
  //       print(data);
  //     });
  //   } catch (e) {
  //     emit(CalfCompetitionError(e.toString()));
  //   }
  // }

  void saveCalfForm({
    String? userName,
    String? villageName,
    String? talukaName,
    String? distName,
    String? userMobile,
    String? doctorMobile,
    String? calfCategory,
    String? calfBirthDate,
    String? enfTagNumber,
    String? currentWeight,
    String? imageUrl,
  }) async {
    var payload = {
      "groupId": 1687348063136,
      "competitionId": "64f0cb6e1fe3af79fb8d1f60",
      "userName": userName,
      "village": villageName,
      "taluka": talukaName,
      "dist": distName,
      "custom_field": [
        {
          "user_mobile": userMobile,
          "mobile_doctor": doctorMobile,
          "calf_caste": calfCategory,
          "calf_dob": calfBirthDate,
          "tag_no": enfTagNumber,
          "weight": currentWeight,
          "imageUrl": imageUrl,
        }
      ]
    };
    try {
      emit(CalfCompetitionLoading());
      var response = await _calfCompetitionRepo.postCalfData(payload);
      response.fold((error) {
        emit(CalfCompetitionError(error.message));
      }, (data) {
        emit(CalfCompetitionLoaded());
      });
    } catch (e) {
      emit(CalfCompetitionError(e.toString()));
    }
  }
}
