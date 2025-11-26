import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wdi/features/buyer/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.initial()) {
    initScrolling();
  }
  final ScrollController scrollController = ScrollController();
  bool showSearchBar = false;
  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }

  void initScrolling() {
    scrollController.addListener(() {
      toggleSearchBar();
    });
  }

  //togel  shwoing search bar when scroll down
  void toggleSearchBar() {
    if (scrollController.position.pixels > 180) {
      if (!showSearchBar) {
        showSearchBar = true;
        emit(const HomeState.showSearchBar());
      }
    } else {
      if (showSearchBar) {
        showSearchBar = false;
        emit(const HomeState.hideSearchBar());
      }
    }
  }
}
