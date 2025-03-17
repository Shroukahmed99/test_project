import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_app/Features/Profile%20User/presentation/manger/Bottom%20sheet%20cubit/bottom_sheet_cubit.dart';
import 'package:profile_app/core/Widget%20reuse/manager/Navigation%20Cubit/navigation_cubit.dart';
import 'package:profile_app/Features/Profile%20User/presentation/views/Widgets/logout_bottomSheet.dart';
import 'package:profile_app/Features/Profile%20User/presentation/views/Widgets/profile_navigation_widget.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NavigationCubit()),
        BlocProvider(create: (context) => BottomSheetCubit()),  // التأكد من إضافة BottomSheetCubit هنا
      ],
      child: Stack(
        children: [
          const Scaffold(
            body: ProfileNavigationWidget(),  // ProfileNavigationWidget سيكون قادرًا على الوصول إلى BottomSheetCubit الآن
          ),
          const LogoutBottomSheet(), // BottomSheet widget
        ],
      ),
    );
  }
}
