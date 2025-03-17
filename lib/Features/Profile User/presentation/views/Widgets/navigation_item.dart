import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile_app/const.dart';


class NavigationItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  const NavigationItem({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          // color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundColor: kPrimaryColor,
              child: Icon(icon, color: secondaryColor, size: 22.r),
            ),
            SizedBox(width: 17.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color:secondaryColor
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: kPrimaryColor,
              size: 20.r,
            ),
          ],
        ),
      ),
    );
  }
}