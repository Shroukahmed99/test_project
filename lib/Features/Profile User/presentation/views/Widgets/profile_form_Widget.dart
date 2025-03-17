import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile_app/Features/Profile%20User/presentation/views/Widgets/custom_bottom.dart';
import 'package:profile_app/Features/Profile%20User/presentation/views/Widgets/password_settings_view.dart';
import 'package:profile_app/core/Widget%20reuse/form_field_widget.dart';
import 'package:profile_app/core/function/validate_function.dart';
import 'package:profile_app/const.dart';

class ProfileFormWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey =GlobalKey();
  final TextEditingController fullNameController =TextEditingController();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController phoneController=TextEditingController();
  final TextEditingController birthDateController=TextEditingController();
  final TextEditingController weightController=TextEditingController();
  final TextEditingController heightController=TextEditingController();
  

   ProfileFormWidget({
    Key? key,

    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            title: "Full name",
            width: double.infinity,
            controller: fullNameController,
            validator: validateFullName,
            hintText: "Mohamed Khaled",
          ),
          CustomTextField(
            title: "Email",
            width: double.infinity,
            controller: emailController,
            validator: validateEmail,
            hintText: "example@gmail.com",
          ),
          CustomTextField(
            title: "Mobile Number",
            width: double.infinity,
            controller: phoneController,
            validator: validatePhone,
            hintText: "01091175364",
          ),
          CustomTextField(
            title: "Date of birth",
            width: double.infinity,
            controller: birthDateController,
            validator: validateAge,
            hintText: "1/1/2002",
          ),
          CustomTextField(
            title: "Weight",
            width: double.infinity,
            controller: weightController,
            validator: validateWeight,
            hintText: "60 kg",
          ),
          CustomTextField(
            title: "Height",
            width: double.infinity,
            controller: heightController,
            validator: validateHeight,
            hintText: "165 CM",
          ),
          SizedBox(height: 20.h),
          Center(
            child: CustomButton(
              text: "Update Profile",
               onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ForgetPasswordView()),
    );
              },
              backgroundColor: accentColor,
            ),
          ),
        ],
      ),
    );
  }
}
