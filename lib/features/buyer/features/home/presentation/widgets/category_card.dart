import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wdi/core/widgets/cashed_images.dart';
import 'package:wdi/features/buyer/features/home/domain/entities/category_entity.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final CategoryEntity category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor, width: 1.w),
        borderRadius: BorderRadius.circular(14),
      ),
      child: CachedImage(url: category.image, radius: 13, fit: BoxFit.fitWidth),
    );
  }
}
