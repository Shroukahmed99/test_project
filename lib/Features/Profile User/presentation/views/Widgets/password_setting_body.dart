import 'package:flutter/material.dart';
import 'package:profile_app/Features/Profile%20User/presentation/views/Widgets/custom_bottom.dart';
import 'package:profile_app/Features/Profile%20User/presentation/views/password_settings_view.dart';
import 'package:profile_app/Features/Profile%20User/presentation/views/setting_profile_view.dart';
import 'package:profile_app/core/Widget%20reuse/buttom_text_forget_password.dart';
import 'package:profile_app/core/Widget%20reuse/custom_text_and_icon_arrowBack.dart';
import 'package:profile_app/core/Widget%20reuse/form_field_widget.dart';
import 'package:profile_app/const.dart';
import 'package:profile_app/core/function/validate_function.dart';

class PasswordSettingBody extends StatelessWidget {
  PasswordSettingBody({super.key});

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 25),
      child: Form(
        key: formKey,
        child: ListView(
          children: [
            const CustomTextAndIconArrowback(
              text: 'Password Settings',
              colorText: usedColor,
              colorArrowIcon: usedColor,
            ),
            SizedBox(height: 60),
            CustomTextField(
              width: 320,
              title: 'Current Password',
              hintText: '*************',
              controller: passwordController,
              validator: validatePassword,
              hintTextColor: kPrimaryColor,
              isPassword: true, // Enable password toggle
            ),
            SizedBox(height: 20),
            const ButtomTextForgetPassword(),
            SizedBox(height: 25),
            CustomTextField(
              width: 320,
              title: 'New Password',
              hintText: '*************',
              controller: newPasswordController,
              validator: validatePassword,
              hintTextColor: kPrimaryColor,
              isPassword: true, // Enable password toggle
            ),
            SizedBox(height: 25),
            CustomTextField(
              width: 320,
              title: 'Confirm New Password',
              hintText: '*************',
              controller: confirmNewPasswordController,
              validator: validatePassword,
              hintTextColor: kPrimaryColor,
              isPassword: true, // Enable password toggle
            ),
            SizedBox(height: 80),
            Center(
              child: CustomButton(
                text: "Change Password",
                onPressed: () {
                  
                  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SettingProfileView()),
    );
                  if (formKey.currentState!.validate()) {
                    // Handle password change logic here
                  }
                },
                backgroundColor:kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}