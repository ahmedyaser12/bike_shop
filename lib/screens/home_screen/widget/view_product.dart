import 'package:e_commerce/core/utils/common_functions.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/styles.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CustomPaint(
        painter: ProductPainter(),
        child: productBody(),
      ),
    );
  }

  productBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [Color(0xff34CAE8), Color(0xff4E49F2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds);
              },
              child: const Icon(
                Icons.favorite_border,
                color: Colors.white,
              )),
        ),
        Image.asset('assets/images/bike.png'),
        heightSpace(17),
        Row(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Text(
                  'Road Bike',
                  style: TextStyles.font13grey500weight,
                  textAlign: TextAlign.end,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 5, bottom: 5),
                child: Text(
                  'PEUGEOT - LR01',
                  style: TextStyles.font15White500weight,
                  textAlign: TextAlign.end,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Text(
                  '\$ 1, 999.99',
                  style: TextStyles.font13grey500weight,
                  textAlign: TextAlign.end,
                ),
              ),
            ])
          ],
        ),
      ],
    );
  }
}

class ProductPainter extends CustomPainter {
  final double borderRadius;

  ProductPainter({this.borderRadius = 15.0});

  @override
  void paint(Canvas canvas, Size size) {
    final Gradient gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        const Color(0xff2e3647).withOpacity(.9),
        const Color(0xff2a3f75).withOpacity(.9),
      ],
      stops: const [0.0, 1.0],
    );
    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    var paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.fill;

    var path = Path();

    // Start from top left
    path.moveTo(0, size.height * .25);
    path.quadraticBezierTo(0, size.height * 0.101, borderRadius * 2,
        size.height * .15 - borderRadius);
    path.lineTo(size.width - borderRadius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, borderRadius);
    path.lineTo(size.width, size.height - borderRadius);
    path.quadraticBezierTo(
        size.width, size.height, size.width - borderRadius, size.height + 5);
    path.lineTo(borderRadius, size.height + size.height * .15);
    path.quadraticBezierTo(
        0, size.height + size.height * .15, 0, size.height + size.height * .10);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
