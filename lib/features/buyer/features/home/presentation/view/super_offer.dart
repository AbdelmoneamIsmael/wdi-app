import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';
import 'package:wdi/core/utils/functions/get_hight.dart';
import 'package:wdi/core/widgets/cashed_images.dart';
import 'package:wdi/features/buyer/features/home/domain/entities/category_entity.dart';
import 'package:wdi/features/buyer/features/home/presentation/widgets/category_card.dart';

class SuperOfferView extends StatelessWidget {
  const SuperOfferView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(height: 24.h),
          Container(
            height: 57.h,
            padding: EdgeInsets.all(5.w),
            width: double.infinity,
            color: const Color(0xffF97415),
            child: Column(
              children: [
                Text(
                  'Super Offer',
                  style: AppTextStyles.extraBold(
                    context,
                  ).copyWith(color: Colors.white, fontSize: 26.sp),
                ),
                Text(
                  'Discover your own products',
                  style: AppTextStyles.regular(
                    context,
                  ).copyWith(color: Colors.white, fontSize: 16.sp),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          const SuperCategoriesView(),

          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}

class SuperCategoriesView extends StatelessWidget {
  const SuperCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xff535353), width: 1.w),
      ),
      child: SizedBox(
        height: 70.w,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
          itemBuilder: (context, index) => SuperCategoryWidget(
            category: categoryList[index],
            selected: index == 0,
          ),
          separatorBuilder: (context, index) => SizedBox(width: 10.w),
          itemCount: categoryList.length,
        ),
      ),
    );
  }
}

class SuperCategoryWidget extends StatelessWidget {
  const SuperCategoryWidget({
    super.key,
    required this.category,
    required this.selected,
  });
  final CategoryEntity category;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23.r),
        border: Border.all(
          color: selected ? Theme.of(context).primaryColor : Colors.transparent,
          width: 1.w,
        ),
      ),
      child: Row(
        children: [
          CachedImage(
            width: 32.w,
            height: 32.w,
            url: category.image,
            radius: 40.r,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 8.w),
          Text(
            category.name,
            style: AppTextStyles.medium(context).copyWith(
              fontSize: 17.sp,
              color: selected ? Theme.of(context).primaryColor : null,
            ),
          ),
        ],
      ),
    );
  }
}
