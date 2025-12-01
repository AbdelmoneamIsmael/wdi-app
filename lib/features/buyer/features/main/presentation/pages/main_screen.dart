import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wdi/core/themes/colors/colors.dart';
import 'package:wdi/features/buyer/features/main/presentation/cubit/main_cubit.dart';
import 'package:wdi/features/buyer/features/main/presentation/cubit/main_state.dart';
import 'package:wdi/features/buyer/features/main/presentation/widgets/btn_nav_item.dart';

import 'package:wdi/gen/assets.gen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          final menuCubit = BlocProvider.of<MainCubit>(context);
          return menuCubit.pages[menuCubit.currentIndex];
        },
      ),
      bottomNavigationBar: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          final mainCubit = BlocProvider.of<MainCubit>(context);
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).bottomNavigationBarTheme.backgroundColor,
                  border: const Border(
                    top: BorderSide(color: Color(0xffE8E8E8), width: 1),
                  ),
                ),
                child: SafeArea(
                  top: false,
                  bottom: true,
                  left: false,
                  right: false,
                  child: Row(
                    mainAxisAlignment: .spaceAround,

                    children: [
                      BottomNavigationItem(
                        icon: Assets.icons.home,
                        title: 'home'.tr(),
                        isSelected: mainCubit.currentIndex == 0,
                        onTap: () {
                          mainCubit.changeIndex(0);
                        },
                      ),
                      BottomNavigationItem(
                        icon: Assets.icons.profile,
                        title: 'profile'.tr(),
                        isSelected: mainCubit.currentIndex == 1,
                        onTap: () {
                          mainCubit.changeIndex(1);
                        },
                      ),

                      Container(
                        padding: const .all(10),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFF7C3BED),
                                const Color(0xFF4318AA).withValues(alpha: 0),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: SvgPicture.asset(
                            Assets.icons.mainCart,
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                      BottomNavigationItem(
                        icon: Assets.icons.cart,
                        title: 'cart'.tr(),
                        isSelected: mainCubit.currentIndex == 2,
                        onTap: () {
                          mainCubit.changeIndex(2);
                        },
                      ),
                      BottomNavigationItem(
                        icon: Assets.icons.menu,
                        title: 'menu'.tr(),
                        isSelected: mainCubit.currentIndex == 3,
                        onTap: () {
                          mainCubit.changeIndex(3);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
