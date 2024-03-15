part of 'top_selling_cubit.dart';

@immutable
abstract class TopSellingState {
  final List<TopSellingItem> items;
  const TopSellingState(this.items);
}

class TopSellingInitial extends TopSellingState {
  const TopSellingInitial(super.items);
}

class TopSellingLoading extends TopSellingState {
  const TopSellingLoading(super.items);
}

class TopSellingError extends TopSellingState {
  final String error;
  const TopSellingError(this.error,super.items);
}

class TopSellingLoaded extends TopSellingState {
  const TopSellingLoaded(super.items);
}
