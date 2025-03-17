import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_app/Features/Profile%20User/presentation/views/profile_view.dart';
import 'package:profile_app/const.dart';
import 'package:profile_app/core/Widget%20reuse/manager/Navigation%20Cubit/navigation_cubit.dart';
import 'package:profile_app/core/utils/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      splitScreenMode: true,
      builder: (_, child) {
        return BlocProvider(
          create: (context) => NavigationCubit(),
          child: MaterialApp.router(

            debugShowCheckedModeBanner: false,
            title: 'Profile App',
            theme: ThemeData(
              scaffoldBackgroundColor: backgroundColor,
              primaryColor: kPrimaryColor,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              

            ),
             routerConfig: AppRouter.router,
          ),
        );
      },
    );
  }
}
