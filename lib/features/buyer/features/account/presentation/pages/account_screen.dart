import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wdi/core/extension/strings_extention.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';
import 'package:wdi/core/utils/functions/get_hight.dart';
import 'package:wdi/core/widgets/app_text_field.dart';
import 'package:wdi/core/widgets/primary_container.dart';
import 'package:wdi/gen/assets.gen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personal Information')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24).w,
        child: Column(
          children: [
            PrimaryContainer(
              padding: const EdgeInsets.only(
                left: 25,
                right: 10,
                top: 25,
                bottom: 25,
              ).w,
              child: Column(
                spacing: 28,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Personal Information',

                              textAlign: TextAlign.start,
                              style: AppTextStyles.bold(context).copyWith(
                                fontSize: 18.sp,
                                height: getTextHeight(18, 24),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        color: Theme.of(context).textTheme.bodyMedium!.color,
                        style: IconButton.styleFrom(
                          padding: const EdgeInsets.all(9),
                          backgroundColor: const Color(0xffFAFAFA),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            side: const BorderSide(color: Color(0xffE4E4E7)),
                          ),
                        ),
                        onPressed: () {},
                        icon: Row(
                          children: [
                            Icon(Icons.edit, size: 20.w),
                            const SizedBox(width: 8),
                            Text(
                              'Edit',
                              style: AppTextStyles.medium(context).copyWith(
                                fontSize: 14.sp,
                                height: getTextHeight(14, 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  AppTextFieldWithTitle(
                    title: 'Full Name',
                    hint: 'Ahmed Al Mansoori',

                    prefixIcon: SvgPicture.asset(
                      Assets.icons.profile,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  const AppTextFieldWithTitle(
                    title: 'Email',
                    hint: 'ahmed.almansoori@example.com',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  const AppTextFieldWithTitle(
                    title: 'Phone',
                    hint: '+971 50 123 4567',
                    prefixIcon: Icon(Icons.phone_outlined),
                  ),
                  Divider(color: Theme.of(context).dividerColor, thickness: 1),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Security', style: AppTextStyles.semiBold(context)),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffFAFAFA),
                          elevation: 0,
                          foregroundColor: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.color,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Theme.of(context).dividerColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          fixedSize: Size.fromHeight(48.h),
                          textStyle: AppTextStyles.medium(context).copyWith(
                            fontSize: 14.sp,
                            height: getTextHeight(14, 20),
                          ),
                        ),
                        onPressed: () {},
                        child: 'Change Password'.toText(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
