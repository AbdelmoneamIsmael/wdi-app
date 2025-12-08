import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wdi/core/routes/pages_keys.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';
import 'package:wdi/core/utils/functions/get_hight.dart';
import 'package:wdi/core/widgets/cashed_images.dart';
import 'package:wdi/features/buyer/features/home/presentation/cubit/home_cubit.dart';
import 'package:wdi/features/buyer/features/home/presentation/cubit/home_state.dart';
import 'package:wdi/gen/assets.gen.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'https://leyenorder.com/wp-content/uploads/2025/08/sale-1-3.png',
      'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/fashion-sale-poster-template-design-938633163f6aa7db26222b1c586d28c1_screen.jpg?ts=1697625018',
      'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/summer-fashion-sale-facebook-design-template-f90ee2a999423a9a9859cdfdeef22803_screen.jpg?ts=1731046956',
    ];
    return SliverAppBar(
      expandedHeight: 300.h,
      pinned: true,
      leadingWidth: 32.w + 20.w,

      toolbarHeight: 60.h,
      titleSpacing: 8.w,
      title: Text(
        'WDI LOGO',
        style: AppTextStyles.bold(context).copyWith(
          fontSize: 15.sp,
          color: Theme.of(context).primaryColor,
          height: getTextHeight(15, 28),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () => GoRouter.of(context).pushNamed(PagesKeys.notification),
          child: Container(
            width: 32.w,
            height: 32.w,
            padding: EdgeInsets.all(5.r),
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(32.r),
            ),
            child: SvgPicture.asset(
              Assets.icons.notification,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        SizedBox(width: 20.w),
        Container(
          width: 32.w,
          height: 32.w,

          padding: EdgeInsets.all(8.r),
          margin: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32.r),
          ),
          child: SvgPicture.asset(
            Assets.icons.menu2,
            fit: BoxFit.scaleDown,
            colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
          ),
        ),
        SizedBox(width: 20.w),
      ],

      leading: Row(
        children: [
          SizedBox(width: 20.w),
          Container(
            width: 32.w,
            height: 32.w,

            padding: EdgeInsets.all(4.r),
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: SvgPicture.asset(
              Assets.icons.cart,

              colorFilter: ColorFilter.mode(
                Theme.of(context).primaryColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
      // 👇👇 أهم جزء (Search bar تحت AppBar)
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final homeCubit = context.read<HomeCubit>();
            return Column(
              children: [
                Visibility(
                  visible: homeCubit.showSearchBar,
                  child: FadeIn(
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 10.h,
                      ),
                      child: Container(
                        height: 45.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 10,
                              color: Colors.black12,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 12.w),
                            const Icon(Icons.search, color: Colors.grey),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Text(
                                'Search for products, brands and more...',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),

      flexibleSpace: LayoutBuilder(
        builder: (context, constrains) {
          return FlexibleSpaceBar(
            background: Stack(
              children: [
                CarouselSlider.builder(
                  itemBuilder: (context, index, realIndex) =>
                      CachedImage(url: images[index], fit: BoxFit.cover),
                  itemCount: images.length,

                  options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 1,
                    padEnds: false,
                    height: double.infinity,
                    autoPlayCurve: Curves.easeInOut,
                    autoPlayInterval: const Duration(seconds: 8),
                    autoPlayAnimationDuration: const Duration(seconds: 4),
                    enlargeCenterPage: false,
                    scrollPhysics: const NeverScrollableScrollPhysics(),
                    enableInfiniteScroll: true,
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).padding.top + 60.h,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 10.h,
                    ),
                    child: Container(
                      height: 45.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 10,
                            color: Colors.black12,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 12.w),
                          const Icon(Icons.search, color: Colors.grey),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Text(
                              'Search for products, brands and more...',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
