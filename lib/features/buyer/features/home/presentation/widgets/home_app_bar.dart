import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';
import 'package:wdi/core/utils/functions/get_hight.dart';
import 'package:wdi/core/widgets/cashed_images.dart';
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
      title: Text(
        'WDI LOGO',
        style: AppTextStyles.bold(context).copyWith(
          fontSize: 15.sp,
          color: Theme.of(context).primaryColor,
          height: getTextHeight(15, 28),
        ),
      ),
      actions: [
        Container(
          width: 32.w,
          height: 32.w,
          padding: EdgeInsets.all(5.r),
          margin: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(32.r),
          ),
          child: SvgPicture.asset(
            Assets.icons.cart,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
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
      expandedHeight: 300.h,
      pinned: true,
      leadingWidth: 32.w + 20.w,
      titleSpacing: 8.w,
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
      flexibleSpace: FlexibleSpaceBar(
        background: CarouselSlider.builder(
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
        // background: CachedImage(
        //   url:
        //       // 'https://leyenorder.com/wp-content/uploads/2025/08/sale-1-3.png',
        //       'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/fashion-sale-poster-template-design-938633163f6aa7db26222b1c586d28c1_screen.jpg?ts=1697625018',
        //   // 'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/summer-fashion-sale-facebook-design-template-f90ee2a999423a9a9859cdfdeef22803_screen.jpg?ts=1731046956',
        //   fit: BoxFit.cover,
        // ),
      ),
    );
  }
}
