import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/styles.dart';
class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Choose Your Bike',
            style: TextStyles.font20WhiteBold,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [
                AppColors.primary,
                AppColors.primary2
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),child: SvgPicture.asset('assets/svgs/searchIcon.svg'),
        ),
      ],
    );
  }
}
