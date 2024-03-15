part of 'action_chip_cubit.dart';

enum ActionChipItem { home, work, family, friends, other }

@immutable
abstract class ActionChipState {
  final ActionChipItem actionChipItem;
  final int index;
  const ActionChipState(this.actionChipItem, this.index);
}

class ActionChipInitial extends ActionChipState {
  const ActionChipInitial(super.actionChipItem, super.index);
}

class SelectActionChipState extends ActionChipState {
  const SelectActionChipState(super.actionChipItem, super.index);
}
