import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wdi/core/themes/colors/colors.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';
import 'package:wdi/core/utils/functions/get_hight.dart';
import 'package:wdi/features/buyer/features/home/domain/entities/site_provider_entity.dart';
import 'package:wdi/features/buyer/features/home/presentation/cubit/home_cubit.dart';
import 'package:wdi/features/buyer/features/home/presentation/cubit/home_state.dart';
import 'package:wdi/features/buyer/features/home/presentation/view/categories_view.dart';
import 'package:wdi/features/buyer/features/home/presentation/view/flash_products_view.dart';
import 'package:wdi/features/buyer/features/home/presentation/view/flash_view.dart';
import 'package:wdi/features/buyer/features/home/presentation/view/super_offer.dart';
import 'package:wdi/features/buyer/features/home/presentation/widgets/home_app_bar.dart';
import 'package:wdi/features/buyer/features/home/presentation/widgets/site_provider_widget.dart';
import 'package:wdi/features/buyer/features/home/presentation/widgets/store_location.dart';
import 'package:wdi/gen/assets.gen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return CustomScrollView(
              controller: context.read<HomeCubit>().scrollController,

              slivers: [
                const HomeAppBar(),
                const StoreLocation(),
                SliverToBoxAdapter(
                  child: Container(
                    height: 71.h,
                    decoration: const BoxDecoration(color: Color(0xffFFF5EE)),

                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => SiteProviderCard(
                        siteProvider: siteProviderList[index],
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 8),
                      itemCount: siteProviderList.length,
                    ),
                  ),
                ),

                const CategoriesView(),
                const FlashView(),
                const FlashProductsView(),
                const SuperOfferView(),
                const FlashProductsView(),
              ],
            );
          },
        ),
      ),
    );
  }
}
