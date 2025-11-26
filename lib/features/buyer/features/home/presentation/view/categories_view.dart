import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wdi/features/buyer/features/home/domain/entities/category_entity.dart';
import 'package:wdi/features/buyer/features/home/presentation/widgets/category_card.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(vertical: 24.h),
      sliver: SliverToBoxAdapter(
        child: SizedBox(
          height: 101.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 19.w),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => AspectRatio(
              aspectRatio: 91 / 101,
              child: CategoryCard(category: categoryList[index]),
            ),
            separatorBuilder: (context, index) => SizedBox(width: 10.w),
            itemCount: categoryList.length,
          ),
        ),
      ),
    );
  }
}
