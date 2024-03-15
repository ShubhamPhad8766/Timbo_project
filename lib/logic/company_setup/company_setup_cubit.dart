// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../repositories/company_setup_repo/company_setup_repo.dart';

part 'company_setup_state.dart';

class CompanySetupCubit extends Cubit<CompanySetupState> {
  final CompanyRepo _companyDetails = CompanyRepo();
  CompanySetupCubit() : super(CompanySetupInitial());

  void saveCompanySetup(
      {String? name,
      String? taxId,
      String? cinNumber,
      String? streetAddress,
      String? locality,
      String? city,
      String? state,
      String? zipCode}) async {
    var data = {
      "name": name,
      "taxId": taxId,
      "CIN": cinNumber,
      "address": [
        {
          "locality": locality,
          "state": state,
          "city": city,
          "zip": zipCode,
          "street": streetAddress,
        }
      ]
    };
    emit(CompanySetupLoading());
    var response = await _companyDetails.saveCompanyDetails(data: data);
    response.fold((error) {
      emit(CompanySetupError(error.message));
    }, (data) {
      emit(CompanySetupSuccess());
    });
  }
}
