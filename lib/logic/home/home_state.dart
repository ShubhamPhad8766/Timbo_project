part of 'home_cubit.dart';

enum NavbarItem { home, search, truck, profile }

@immutable
abstract class HomeState {
  final NavbarItem navbarItem;
  final int index;
 const HomeState(
    this.navbarItem,
    this.index,
  );
}

class HomeInitial extends HomeState {
  const HomeInitial(super.navbarItem, super.index);
}

class NavigationState extends HomeState {
  const NavigationState(super.navbarItem, super.index);
}
