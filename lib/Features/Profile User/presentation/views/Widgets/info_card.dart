import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile_app/const.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String value;

  const InfoCard({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center, // مهم عشان يوسّط المحتوى
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: const BoxDecoration(
        color: accentColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
