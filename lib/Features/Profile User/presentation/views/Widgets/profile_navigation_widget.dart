import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile_app/Features/Profile%20User/presentation/manger/Bottom%20sheet%20cubit/bottom_sheet_cubit.dart';
import 'package:profile_app/Features/Profile%20User/presentation/manger/Bottom%20sheet%20cubit/bottom_sheet_state.dart';
import 'package:profile_app/core/Widget%20reuse/bottom_navigation_bar.dart';
import 'package:profile_app/Features/Profile%20User/presentation/views/Widgets/navigation_item.dart';
import 'package:profile_app/Features/Profile%20User/presentation/views/Widgets/profile_header_widget.dart';
import 'package:image_picker/image_picker.dart';

class ProfileNavigationWidget extends StatefulWidget {
  const ProfileNavigationWidget({Key? key}) : super(key: key);

  @override
  State<ProfileNavigationWidget> createState() => _ProfileNavigationWidgetState();
}

class _ProfileNavigationWidgetState extends State<ProfileNavigationWidget> {
  File? _pickedImage;

 
  
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Access the cubit and listen to state changes
    final bottomSheetCubit = context.watch<BottomSheetCubit>();
    final isBottomSheetVisible = bottomSheetCubit.state is BottomSheetVisible;
    
    // Change scaffold background color based on bottom sheet state
    final backgroundColor = isBottomSheetVisible 
        ? Colors.black.withOpacity(0.5)  // Dark overlay when bottom sheet is visible
        : Color(0xFFFAF3E1);      // Normal background color
        
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileHeaderWidget(
                
                pickedImage: _pickedImage,
                onPickImage: _pickImage,
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: NavigationItem(
                  title: "Profile",
                  icon: Icons.person,
                  onTap: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: NavigationItem(
                  title: "Favorite",
                  icon: Icons.star,
                  onTap: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: NavigationItem(
                  title: "Privacy Policy",
                  icon: Icons.lock,
                  onTap: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: NavigationItem(
                  title: "Settings",
                  icon: Icons.settings,
                  onTap: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: NavigationItem(
                  title: "Logout",
                  icon: Icons.logout,
                  onTap: () {
                    // Toggle bottom sheet when pressed
                    bottomSheetCubit.toggleBottomSheet();
                  },
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
