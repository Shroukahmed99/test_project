import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_app/core/Widget%20reuse/manager/Navigation%20Cubit/navigation_cubit.dart';
import 'package:profile_app/core/Widget%20reuse/Bottom_navigation_icon.dart';
import 'package:profile_app/const.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, state) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: Container(
            height: 55,
            color: kPrimaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomNavigationIcon(
                  icon: Icons.home,
                  index: 0,
                  isSelected: state == 0,
                ),
                BottomNavigationIcon(
                  icon: Icons.star,
                  index: 1,
                  isSelected: state == 1,
                ),
                BottomNavigationIcon(
                  icon: Icons.group,
                  index: 2,
                  isSelected: state == 2,
                ),
                BottomNavigationIcon(
                  icon: Icons.person,
                  index: 3,
                  isSelected: state == 3,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}