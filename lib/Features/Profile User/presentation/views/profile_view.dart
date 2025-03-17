
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_app/Features/Profile User/presentation/views/Widgets/profile_body.dart';
import 'package:profile_app/Features/Profile%20User/presentation/manger/profile%20cubit/profile_cubit.dart';
import 'package:profile_app/core/Widget reuse/bottom_navigation_bar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit(),
      child:const Scaffold(
        body:  SafeArea(child: ProfileBody()),
        bottomNavigationBar:  CustomBottomNavBar(),
      ),
    );
  }
}
