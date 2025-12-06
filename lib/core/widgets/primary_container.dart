import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryContainer extends StatelessWidget {
  const PrimaryContainer({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.borderRadius,
    this.decoration,
  });
  final Widget child;
  final EdgeInsetsGeometry? padding, margin;
  final BorderRadiusGeometry? borderRadius;
  final ShapeDecoration? decoration;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(25).w,
      margin: margin,

      decoration: decoration ?? BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Theme.of(context).dividerColor, width: 1),
      ),
      child: child,
    );
  }
}
