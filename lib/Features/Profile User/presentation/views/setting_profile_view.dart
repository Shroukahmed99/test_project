import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_app/Features/Profile%20User/presentation/manger/Bottom%20sheet%20cubit/bottom_sheet_state.dart';
import 'package:profile_app/Features/Profile%20User/presentation/manger/Logout%20Cubit/logout_cubit.dart';
import 'package:profile_app/Features/Profile%20User/presentation/manger/profile%20cubit/profile_cubit.dart';
import 'package:profile_app/Features/Profile%20User/presentation/manger/Bottom%20sheet%20cubit/bottom_sheet_cubit.dart';
import 'package:profile_app/Features/Profile%20User/presentation/views/Widgets/profile_setting_body.dart';
import 'package:profile_app/core/Widget%20reuse/bottom_navigation_bar.dart';

class SettingProfileView extends StatelessWidget {
  const SettingProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ProfileCubit()),
        BlocProvider(create: (_) => BottomSheetCubit()),
        BlocProvider(create: (_) => LogoutCubit()),
      ],
      child: BlocBuilder<BottomSheetCubit, BottomSheetState>(
        builder: (context, state) {
          bool isBottomSheetVisible = state is BottomSheetVisible;

          return Scaffold(
            backgroundColor: isBottomSheetVisible ? Colors.black.withOpacity(0.5) : Colors.white,
            body: SafeArea(
              child: Stack(
                children: const [
                  ProfileSettingBody(),
                ],
              ),
            ),
            bottomNavigationBar: const CustomBottomNavBar(),
          );
        },
      ),
    );
  }
}
