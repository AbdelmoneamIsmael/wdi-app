import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SliverPaddingWidget on Widget {
  /// Padding only for start, end, top, bottom it handel screen util
  /// no need to pass .w or .h
  SliverPadding sliverPaddingOnly({
    double? start,
    double? top,
    double? end,
    double? bottom,
  }) => SliverPadding(
    padding: EdgeInsetsDirectional.only(
      start: (start ?? 0).w,
      top: (top ?? 0).h,
      end: (end ?? 0).w,
      bottom: (bottom ?? 0).h,
    ),
    sliver: this,
  );

  SliverPadding sliverPaddingSymmetric({
    double? horizontal,
    double? vertical,
  }) => SliverPadding(
    padding: EdgeInsets.symmetric(
      horizontal: horizontal ?? 0,
      vertical: vertical ?? 0,
    ),
    sliver: this,
  );

  SliverPadding sliverPaddingAll({required double all}) =>
      SliverPadding(padding: EdgeInsets.all(all), sliver: this);
}

extension ToSliver on Widget {
  SliverToBoxAdapter toSliver() => SliverToBoxAdapter(child: this);
}
