import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_app/core/Widget%20reuse/manager/Navigation%20Cubit/navigation_cubit.dart';
import 'package:profile_app/const.dart';

class BottomNavigationIcon extends StatelessWidget {
  final IconData icon;
  final int index;
  final bool isSelected;
  final VoidCallback? onTap;

  const BottomNavigationIcon({
    Key? key,
    required this.icon,
    required this.index,
    required this.isSelected,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<NavigationCubit>().updateIndex(index);
        if (onTap != null) {
          onTap!();
        }
      },
      child: Icon(
        icon,
        size: 29,
        color: isSelected ? usedColor : backgroundColor,
      ),
    );
  }
}
