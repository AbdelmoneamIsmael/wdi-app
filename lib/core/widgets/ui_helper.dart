import 'dart:developer';


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import '../themes/colors/colors.dart';
import '../themes/styles/app_text_style.dart';
// import 'package:animated_snack_bar/animated_snack_bar.dart';

class UIHelper {
  static BoxShadow shadow() {
    return BoxShadow(
      color: Colors.black.withAlpha((0.5 * 255).round()),
      spreadRadius: -5,
      blurRadius: 10,
      offset: const Offset(0, 0),
    );
  }

  // static void showSnakBar({
  //   String? title,
  //   required BuildContext context,
  //   required String message,
  //   required String iconPath,
  // }) {
  //   AnimatedSnackBar(
  //     animationCurve: Curves.easeOutCirc,
  //     duration: const Duration(seconds: 6),
  //     animationDuration: const Duration(seconds: 3),
  //     builder: (context) => Container(
  //       padding: const EdgeInsets.all(13),
  //       decoration: const BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.all(Radius.circular(12))),
  //       child: Row(
  //         children: [
  //           SvgPicture.asset(iconPath),
  //           const SizedBox(width: 6),
  //           Expanded(
  //             child: Column(
  //               children: [
  //                 if (title != null)
  //                   Column(
  //                     children: [
  //                       Text(
  //                         title,
  //                         style: AppTextStyles.bold(context).copyWith(
  //                           fontSize: 12.sp,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 const SizedBox(
  //                   height: 5,
  //                 ),
  //                 Text(
  //                   message,
  //                   style: AppTextStyles.medium(context).copyWith(
  //                     fontSize: 12.sp,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   ).show(
  //     context,
  //   );
  // }

  static void showBackDialog(
      {required String message,
      required String title,
      required void Function()? onPressed,
      required BuildContext context}) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          title,
          style: AppTextStyles.bold(context).copyWith(
           
            fontSize: 16.sp,
          ),
        ),
        content: Text(
          message,
          style: AppTextStyles.medium(context),
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            child: Text(
              'cancel'.tr(),
              style: AppTextStyles.regular(context).copyWith(
                color: LightColors.redColor,
              ),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          CupertinoDialogAction(
            onPressed: () async {
              dynamic pressaction;
              if (onPressed != null) pressaction = onPressed;
              pressaction();
              Navigator.of(context).pop();
            },
            child: Text(
              'i_am_sure'.tr(),
              style: AppTextStyles.semiBold(context),
            ),
          ),
        ],
      ),
    );
  }
}

class PrinterHelper {
  PrinterHelper(this.title) {
    log(title);
  }
  final String title;
}
