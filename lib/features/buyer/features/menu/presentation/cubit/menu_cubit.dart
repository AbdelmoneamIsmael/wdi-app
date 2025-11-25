import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wdi/features/buyer/features/cart/presentation/pages/cart_screen.dart';
import 'package:wdi/features/buyer/features/home/presentation/pages/home_screen.dart';
import 'package:wdi/features/buyer/features/menu/presentation/cubit/menu_state.dart';
import 'package:wdi/features/buyer/features/menu/presentation/pages/menu.dart';
import 'package:wdi/features/buyer/features/profile/presentation/pages/profile_screen.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(const MenuState.initial());

}
