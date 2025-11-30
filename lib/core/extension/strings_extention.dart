import 'dart:convert';

import 'package:flutter/material.dart';

extension StringsExtension on String {
  /// Convert string to text with style
  Text toText({TextStyle? style, int? maxLines, TextOverflow? overflow}) =>
      Text(this, style: style, maxLines: maxLines, overflow: overflow);

  ///convert string to capitalize
  String toCapitalize() => split(' ')
      .map((word) => word.substring(0, 1).toUpperCase() + word.substring(1))
      .join(' ');

  /// convert String to double
  double toDouble() => double.parse(this);

  /// convert String to int
  int toInt() => int.parse(this);

  /// convert String to bool
  bool toBool() => bool.parse(this);

  /// convert String to list
  List<String> toList() => split(',');

  /// convert String to map
  Map<String, dynamic> toMap() => jsonDecode(this);

  /// number like this 1000000 to 1,000,000
  String toNumber() =>
      replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (Match m) => ',');
}
