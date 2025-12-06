import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wdi/core/themes/colors/colors.dart';
import 'package:wdi/core/themes/styles/app_text_style.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    this.userName,
    this.userEmail,
    this.userImage,
    this.onEditTap,
  });

  final String? userName;
  final String? userEmail;
  final String? userImage;
  final VoidCallback? onEditTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.r),
          bottomRight: Radius.circular(24.r),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Profile',
                style: AppTextStyles.bold(
                  context,
                ).copyWith(fontSize: 24.sp, color: Colors.white),
              ),
              if (onEditTap != null)
                GestureDetector(
                  onTap: onEditTap,
                  child: Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(Icons.edit, color: Colors.white, size: 20.sp),
                  ),
                ),
            ],
          ),
          SizedBox(height: 32.h),
          Stack(
            children: [
              Container(
                width: 100.w,
                height: 100.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: Colors.white, width: 4),
                ),
                child: userImage != null
                    ? ClipOval(
                        child: userImage!.startsWith('http')
                            ? Image.network(
                                userImage!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    _buildDefaultAvatar(),
                              )
                            : Image.asset(
                                userImage!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    _buildDefaultAvatar(),
                              ),
                      )
                    : _buildDefaultAvatar(),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 32.w,
                  height: 32.w,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 16.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          if (userName != null)
            Text(
              userName!,
              style: AppTextStyles.bold(
                context,
              ).copyWith(fontSize: 20.sp, color: Colors.white),
            ),
          if (userEmail != null) ...[
            SizedBox(height: 4.h),
            Text(
              userEmail!,
              style: AppTextStyles.regular(
                context,
              ).copyWith(fontSize: 14.sp, color: Colors.white.withOpacity(0.8)),
            ),
          ],
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  Widget _buildDefaultAvatar() {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: LightColors.lightGreyColor,
      ),
      child: Icon(Icons.person, size: 50.sp, color: LightColors.greyColor),
    );
  }
}
