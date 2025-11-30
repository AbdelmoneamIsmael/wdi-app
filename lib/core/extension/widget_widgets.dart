import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ToWidget on Widget {
  Center toCenter() => Center(child: this);
  Expanded toExpanded() => Expanded(child: this);
  Flexible toFlexible() => Flexible(child: this);
  IntrinsicHeight toIntrinsicHeight() => IntrinsicHeight(child: this);
  IntrinsicWidth toIntrinsicWidth() => IntrinsicWidth(child: this);
  OverflowBox toOverflowBox() => OverflowBox(child: this);
  SizedBox toSizedBox({required double width, required double height}) =>
      SizedBox(width: width, height: height, child: this);
  AspectRatio toAspectRatio({required double aspectRatio}) =>
      AspectRatio(aspectRatio: aspectRatio, child: this);
  Stack toStack() => Stack(children: [this]);

  /// Padding only for start, end, top, bottom it handel screen util
  /// no need to pass .w or .h
  Padding toPaddingOnly({
    double? start,
    double? end,
    double? top,
    double? bottom,
  }) => Padding(
    padding: EdgeInsetsDirectional.only(
      start: (start ?? 0).w,
      end: (end ?? 0).w,
      top: (top ?? 0).h,
      bottom: (bottom ?? 0).h,
    ),
    child: this,
  );

  /// Padding horizontal it handel screen util
  /// no need to pass .w
  Padding toPaddingHorizontal({required double horizontal}) => Padding(
    padding: EdgeInsetsDirectional.symmetric(horizontal: horizontal.w),
    child: this,
  );

  /// Padding vertical it handel screen util
  /// no need to pass .h
  Padding toPaddingVertical({required double padding}) => Padding(
    padding: EdgeInsetsDirectional.symmetric(vertical: padding.h),
    child: this,
  );

  /// Padding all it handel screen util
  /// no need to pass .w
  Padding toPaddingAll({required double padding}) =>
      Padding(padding: EdgeInsets.all(padding.w), child: this);
}
