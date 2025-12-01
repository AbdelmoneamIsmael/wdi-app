import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wdi/features/buyer/features/home/domain/entities/product_entity.dart';
import 'package:wdi/features/buyer/features/home/presentation/widgets/product_widget.dart';

class FlashProductsView extends StatelessWidget {
  const FlashProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    final productList = ProductSampleData.generateSampleProducts();
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      sliver: SliverGrid.builder(
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
        itemCount: productList.length,
      ),
    );
  }
}
