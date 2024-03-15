import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'action_chip_state.dart';

class ActionChipCubit extends Cubit<ActionChipState> {
  ActionChipCubit()
      : super(const SelectActionChipState(ActionChipItem.home, 0));

  final GlobalKey<ScaffoldState> drawerKey = GlobalKey();

  void getActionChipItem(index) {
    switch (index) {
      case 0:
        emit(const SelectActionChipState(ActionChipItem.home, 0));
        break;
      case 1:
        emit(const SelectActionChipState(ActionChipItem.work, 1));
        break;
      case 2:
        emit(const SelectActionChipState(ActionChipItem.family, 2));
        break;
      case 3:
        emit(const SelectActionChipState(ActionChipItem.friends, 3));
        break;
      case 4:
        emit(const SelectActionChipState(ActionChipItem.other, 4));
        break;
      default:
        emit(const SelectActionChipState(ActionChipItem.home, 0));
        break;
    }
  }
}
