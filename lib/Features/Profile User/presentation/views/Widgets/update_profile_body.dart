import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile_app/core/Widget%20reuse/bottom_navigation_bar.dart';
import 'package:profile_app/Features/Profile%20User/presentation/views/Widgets/profile_form_widget.dart';
import 'package:profile_app/Features/Profile%20User/presentation/views/Widgets/profile_header_widget.dart';

class UpdateProfileBody extends StatefulWidget {
  const UpdateProfileBody({Key? key}) : super(key: key);

  @override
  State<UpdateProfileBody> createState() => _UpdateProfileBodyState();
}

class _UpdateProfileBodyState extends State<UpdateProfileBody> {
  File? _pickedImage;



  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
        // userData = userData.copyWith(profileImage: pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ProfileHeaderWidget(
              // profile:userData,
              pickedImage: _pickedImage,
              onPickImage: _pickImage,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h),
                       ProfileFormWidget(),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
