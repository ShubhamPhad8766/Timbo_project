part of "calf_competition_cubit.dart";

abstract class CalfCompetitionState {
  CalfCompetitionResponseModel? data;
  CalfCompetitionState({this.data});
}

class CalfCompetitionInitial extends CalfCompetitionState {
  CalfCompetitionInitial({super.data});
}

class CalfCompetitionLoading extends CalfCompetitionState {}

class CalfCompetitionError extends CalfCompetitionState {
  final String? errorMesage;
  CalfCompetitionError(this.errorMesage, {super.data});
}

class CalfCompetitionLoaded extends CalfCompetitionState {
  CalfCompetitionLoaded({super.data});
}
