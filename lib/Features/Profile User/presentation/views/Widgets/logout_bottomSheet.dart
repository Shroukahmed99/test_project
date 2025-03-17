import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile_app/Features/Profile%20User/presentation/manger/Bottom%20sheet%20cubit/bottom_sheet_cubit.dart';
import 'package:profile_app/Features/Profile%20User/presentation/manger/Bottom%20sheet%20cubit/bottom_sheet_state.dart';
import 'package:profile_app/Features/Profile%20User/presentation/manger/Logout%20Cubit/logout_cubit.dart';
import 'package:profile_app/Features/Profile%20User/presentation/manger/logout%20cubit/logout_state.dart';
import 'package:profile_app/const.dart';

class LogoutBottomSheet extends StatelessWidget {
  const LogoutBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomSheetCubit, BottomSheetState>(
      builder: (context, state) {
        if (state is BottomSheetVisible) {
          return _buildLogoutBottomSheet(context);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _buildLogoutBottomSheet(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: GestureDetector(
        onTap: () {}, // Prevent tap propagation to background
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.transparent, // Make transparent since scaffold is already dark
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  context.read<BottomSheetCubit>().hideBottomSheet();
                },
                child: Container(
                  height: MediaQuery.of(context).size.height - 150.h,
                  width: double.infinity,
                ),
              ),
              BlocProvider(
                create: (context) => LogoutCubit(),
                child: _buildLogoutDialog(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogoutDialog(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: const Color(0xFFFF7F27), // Orange color
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      padding: EdgeInsets.all(16.r),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Are you sure you want\n to log out?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: usedColor,
                fontFamily: 'League Spartan',
                fontSize: 28.sp,
                fontWeight: FontWeight.w900,
                decoration: TextDecoration.none,
              ),
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: BlocBuilder<LogoutCubit, LogoutState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: state is LogoutLoading
                            ? null
                            : () {
                                context.read<BottomSheetCubit>().hideBottomSheet();
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.r),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                        ),
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            color: accentColor,
                            fontSize: 16.sp,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: BlocConsumer<LogoutCubit, LogoutState>(
                    listener: (context, state) {
                      if (state is LogoutSuccess) {
                        context.read<BottomSheetCubit>().hideBottomSheet();
                        // Navigate to login screen if needed
                        // Navigator.of(context).pushReplacementNamed('/login');
                      } else if (state is LogoutError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.message)),
                        );
                      }
                    },
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: state is LogoutLoading
                            ? null
                            : () => context.read<LogoutCubit>().logout(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: accentColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.r),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                        ),
                        child: state is LogoutLoading
                            ? SizedBox(
                                height: 20.h,
                                width: 20.w,
                                child: const CircularProgressIndicator(
                                  color: usedColor,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                "Yes, logout",
                                style: TextStyle(
                                  color: usedColor,
                                  fontSize: 16.sp,
                                ),
                              ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}