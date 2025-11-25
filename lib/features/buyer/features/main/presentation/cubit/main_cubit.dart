import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wdi/features/buyer/features/main/presentation/cubit/main_state.dart';
import 'package:wdi/features/buyer/features/home/presentation/pages/home_screen.dart';
import 'package:wdi/features/buyer/features/cart/presentation/pages/cart_screen.dart';
import 'package:wdi/features/buyer/features/menu/presentation/pages/menu.dart';
import 'package:wdi/features/buyer/features/profile/presentation/pages/profile_screen.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState.initial());
  final List<Widget> pages = [
    const HomeScreen(),
    const ProfileScreen(),

    const CartScreen(),
    const MenuScreen(),
  ];

  int get currentIndex => _currentIndex;
  int _currentIndex = 0;
  void changeIndex(int index) {
    _currentIndex = index;
    emit(MainState.changeIndex(index));
  }
}
