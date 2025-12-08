import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryContainer extends StatelessWidget {
  const PrimaryContainer({
    this.boxShadow,
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.borderRadius,
    this.decoration,
    this.color,
    this.withShadow = false,
  });
  final Widget child;
  final EdgeInsetsGeometry? padding, margin;
  final BorderRadiusGeometry? borderRadius;
  final ShapeDecoration? decoration;
  final List<BoxShadow>? boxShadow;
  final Color? color;
  final bool withShadow;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(25).w,
      margin: margin,

      decoration:
          decoration ??
          BoxDecoration(
            color: color ?? Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Theme.of(context).dividerColor, width: 1),
            boxShadow: withShadow
                ? const [
                    BoxShadow(
                      color: Color(0x0C000000),
                      blurRadius: 2,
                      offset: Offset(0, 1),
                      spreadRadius: 0,
                    ),
                  ]
                : boxShadow,
          ),
      child: child,
    );
  }
}
