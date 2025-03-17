import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile_app/Features/Profile%20User/presentation/views/profile_view.dart';
import 'package:profile_app/const.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      // minTextAdaptation: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Profile App',
          theme: ThemeData(
            scaffoldBackgroundColor: backgroundColor,
            primaryColor: kPrimaryColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: ProfileView (),
        );
      },
    );
  }
}