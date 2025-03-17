import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_app/core/Widget%20reuse/manager/password%20visibility%20cubit/password_visibility_cubit.dart';
import 'package:profile_app/Features/Profile%20User/presentation/views/Widgets/password_setting_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PasswordVisibilityCubit>(
          create: (context) => PasswordVisibilityCubit(),
        ),
      ],
      child: Scaffold(
        body: PasswordSettingBody(),
      ),
    );
  }
}