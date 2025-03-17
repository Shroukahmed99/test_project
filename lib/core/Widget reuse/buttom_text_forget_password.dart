import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile_app/const.dart';


class ButtomTextForgetPassword extends StatelessWidget {
  const ButtomTextForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
        
        },
        child: Text(
          'Forgot Password?',
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
