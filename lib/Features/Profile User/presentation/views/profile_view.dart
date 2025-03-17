import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_app/core/Widget%20reuse/manager/Navigation%20Cubit/navigation_cubit.dart';
import 'package:profile_app/Features/Profile%20User/presentation/views/Widgets/update_profile_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: Scaffold(
        body: UpdateProfileBody(),
      ),
    );
  }
}




