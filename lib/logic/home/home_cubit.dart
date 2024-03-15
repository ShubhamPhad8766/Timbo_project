// ignore_for_file: unnecessary_import, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {


  HomeCubit() : super(const NavigationState(NavbarItem.home, 0));

  final GlobalKey<ScaffoldState> drawerKey = GlobalKey();

 

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.home:
        emit(const NavigationState(NavbarItem.home, 0));
        break;
      case NavbarItem.profile:
        emit(const NavigationState(NavbarItem.profile, 3));
        break;
      case NavbarItem.search:
        emit(const NavigationState(NavbarItem.search, 1));
        break;
      case NavbarItem.truck:
        emit(const NavigationState(NavbarItem.truck, 2));
        break;
    }
  }
}
