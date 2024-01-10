import 'package:e_commerce/core/utils/colors.dart';
import 'package:e_commerce/screens/home_screen/view_model/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatelessWidget {
  final HomeScreenViewModel viewModel;

  const BottomNavBar({super.key, required this.viewModel});

  //int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (int index) {
        viewModel.currentNavBarIndex(index);
      },
      height: 55,
      backgroundColor: const Color(0xff3a4574),
      indicatorShape: const TrapezoidIndicatorShape(),
      selectedIndex: viewModel.navBarIndex,
      destinations: <Widget>[
        NavigationDestination(
          selectedIcon: SvgPicture.asset(
            'assets/svgs/bicycle.svg',
            color: AppColors.whiteColor,
          ),
          label: '',
          icon: SvgPicture.asset('assets/svgs/bicycle.svg',
              color: AppColors.greyColor),
        ),
        NavigationDestination(
          selectedIcon: SvgPicture.asset(
            'assets/svgs/map.svg',
            color: AppColors.whiteColor,
          ),
          icon: SvgPicture.asset('assets/svgs/map.svg',
              color: AppColors.greyColor),
          label: '',
        ),
        NavigationDestination(
          selectedIcon: SvgPicture.asset(
            'assets/svgs/cart.svg',
            color: AppColors.whiteColor,
          ),
          icon: SvgPicture.asset('assets/svgs/cart.svg',
              color: AppColors.greyColor),
          label: '',
        ),
        NavigationDestination(
          selectedIcon: SvgPicture.asset(
            'assets/svgs/person.svg',
            color: AppColors.whiteColor,
          ),
          icon: SvgPicture.asset('assets/svgs/person.svg',
              color: AppColors.greyColor),
          label: '',
        ),
        NavigationDestination(
          selectedIcon: SvgPicture.asset(
            'assets/svgs/doc.text',
            color: AppColors.whiteColor,
          ),
          icon: SvgPicture.asset('assets/svgs/doc.text',
              color: AppColors.greyColor),
          label: '',
        ),
      ],
    );
  }
}

class TrapezoidIndicatorShape extends ShapeBorder {
  final double height;
  final double
      topWidthPercentage; // Percentage of the width at the top of the trapezoid relative to the bottom.
  final double borderRadius;

  const TrapezoidIndicatorShape({
    this.height = 50,
    this.topWidthPercentage = 1,
    this.borderRadius = 15.0,
  });

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(bottom: height);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    // The points for the trapezoid corners
    Offset bottomLeft = Offset(rect.left, rect.bottom);

    // Create the trapezoid path with rounded corners
    Path path = Path();
    path.moveTo(rect.left, 10);
    path.quadraticBezierTo(
        rect.left, -5, rect.left + borderRadius, rect.top - 9);
    path.lineTo(rect.right - borderRadius, rect.top - 14);
    path.quadraticBezierTo(
        rect.right, rect.top - (borderRadius + 2), rect.right, rect.top);
    path.lineTo(rect.right, rect.bottom - borderRadius);
    path.quadraticBezierTo(
        rect.right, rect.bottom, rect.right - borderRadius, rect.bottom + 3);
    path.lineTo(rect.left + 7, bottomLeft.dy + 9);
    path.quadraticBezierTo(rect.left, rect.bottom + 7, 0, rect.bottom);
    path.close();

    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    const Gradient gradient = LinearGradient(
      colors: [Color(0xff34C8E8), Color(0xff4E4AF2)],
      // Define gradient colors here
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    final Paint paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.fill;
    canvas.drawPath(getOuterPath(rect, textDirection: textDirection), paint);
  }

  @override
  ShapeBorder scale(double t) {
    return this;
  }
}
