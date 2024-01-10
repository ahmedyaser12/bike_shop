import 'package:e_commerce/core/utils/colors.dart';
import 'package:e_commerce/screens/home_screen/view_model/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Categories extends StatelessWidget {
  final HomeScreenViewModel viewModel;

  const Categories({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        left: 30,
        top: 375,
        child: buildContainer(Text(
          'All',
          style: TextStyle(color: AppColors.whiteColor),
        )),
      ),
      Positioned(
        left: 107,
        top: 362,
        child: buildContainer(
            SvgPicture.asset('assets/svgs/batteryblock.fill.svg')),
      ),
      Positioned(
        left: 182,
        top: 347,
        child: buildContainer(SvgPicture.asset('assets/svgs/Road.svg')),
      ),
      Positioned(
        right: 105,
        top: 335,
        child: buildContainer(SvgPicture.asset('assets/svgs/Pyramid.svg')),
      ),
      Positioned(
        right: 30,
        top: 325,
        child: buildContainer(SvgPicture.asset('assets/svgs/Union.svg')),
      ),
    ]);
  }

  Container buildContainer(Widget widget) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              viewModel.categoriesIndex == 0
                  ? Color(0xff353F54)
                  : Color(0xff34C8E8),
              viewModel.categoriesIndex == 0
                  ? Color(0xff222834)
                  : Color(0xff4E4AF2),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12)),
      child: Center(child: widget),
    );
  }
}
