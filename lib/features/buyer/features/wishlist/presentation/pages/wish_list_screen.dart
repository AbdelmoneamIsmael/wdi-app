import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wdi/core/extension/sliver_widget.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';
import 'package:wdi/core/utils/functions/get_hight.dart';
import 'package:wdi/features/buyer/features/home/domain/entities/product_entity.dart';
import 'package:wdi/features/buyer/features/home/presentation/widgets/product_widget.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productList = ProductSampleData.generateSampleProducts();
    return Scaffold(
      appBar: AppBar(title: const Text('Wish List')),
      body: CustomScrollView(
        slivers: [
          Text(
            'My Wish List',
            style: AppTextStyles.semiBold(
              context,
            ).copyWith(fontSize: 22.3.sp, height: getTextHeight(22.3, 32)),
          ).toSliver().sliverPaddingOnly(
            top: 24,
            bottom: 24,
            start: 16,
            end: 16,
          ),
          const SizedBox(height: 24).toSliver(),
          SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width < 375
                  ? 171 / 425
                  : 171 / 385,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
            itemBuilder: (context, index) =>
                ProductWidget(product: productList[index]),
            itemCount: 3,
          ).sliverPaddingSymmetric(horizontal: 8),
        ],
      ),
    );
  }
}
