// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../repositories/auth/auth_repo.dart';
import '../../utils/preferences/local_preferences.dart';

part 'personal_info_state.dart';

class PersonalInfoCubit extends Cubit<PersonalInfoState> {
  final AuthRepo _authRepo = AuthRepo();
  PersonalInfoCubit() : super(PersonalInfoInitial());

  void signUp(
      {String? number,
      String? password,
      String? fullname,
      String? securityPin,
      String? locality,
      String? streetAddress,
      String? city,
      String? state,
      String? zipCode}) async {
    var data = {
      "name": fullname,
      "password": password,
      "mobile": number,
      "phoneNumber": number,
      "pin": securityPin
    };
    emit(PersonalInfoLoading());
    var response = await _authRepo.signUp(data: data);
    response.fold((error) {
      emit(SignUpError(error.message));
    }, (data) {
      LocalStorage.saveUserDetails(data.token ?? "");
      saveUserProfile(data.data?.id ?? "", number, locality, streetAddress,
          city, state, zipCode);
    });
  }

  void saveUserProfile(
      String? id,
      String? number,
      String? locality,
      String? streetAddress,
      String? city,
      String? state,
      String? zipCode) async {
    var data = {
      "phoneNo": number,
      "addresses": [
        {
          "tag": "Home",
          "locality": locality,
          "state": state,
          "city": city,
          "zip": zipCode,
          "street": streetAddress,
          "isdefault": true
        }
      ]
    };
    var response = await _authRepo.saveUserProfile(
      id ?? "",
      data: data,
    );
    response.fold((error) {
      emit(PersonalInfoError(error.message));
    }, (data) {
      emit(PersonalInfoSuccess());
    });
  }
}
