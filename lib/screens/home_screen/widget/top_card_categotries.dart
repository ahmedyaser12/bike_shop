import 'package:e_commerce/core/utils/common_functions.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/styles.dart';

class TopCard extends StatelessWidget {
  const TopCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: 250,
              child: CustomPaint(
                painter: CardPainter(
                  color: const Color(0xff2e374a).withOpacity(.7),
                ),
                child: Column(
                  children: [
                    Image.asset('assets/images/bike.png',width: double.infinity,),
                    heightSpace(20),
                    Row(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, bottom: 15.0),
                          child: Text(
                            '30% Off',
                            style: TextStyles.font20White700weight,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CardPainter extends CustomPainter {
  final double borderRadius;
  final Color color;

  CardPainter({required this.color, this.borderRadius = 15.0});

  @override
  void paint(Canvas canvas, Size size) {
    final Gradient gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        const Color(0xff2e374a).withOpacity(.7),
        const Color(0xff32506c).withOpacity(.9),
      ],
      stops: const [0.0, 1.0],
    );
    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    var paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.fill;
    final Paint borderPaint = Paint()
      ..color = Colors.grey[800]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    var path = Path();

    // Start from top left
    path.moveTo(0, borderRadius);
    // Top left corner
    path.quadraticBezierTo(0, 0, borderRadius, 0);
    // Line to top right
    path.lineTo(size.width - borderRadius, 0);
    // Top right corner
    path.quadraticBezierTo(size.width, 0, size.width, borderRadius);
    // Line to bottom right
    path.lineTo(size.width, size.height - 50 - borderRadius);
    // Bottom right corner
    path.quadraticBezierTo(size.width, size.height - 50,
        size.width - borderRadius, size.height - 50);
    // Line to bottom left
    path.lineTo(borderRadius, size.height);
    // Bottom left corner
    path.quadraticBezierTo(0, size.height, 0, size.height - borderRadius);
    path.lineTo(0, borderRadius);

    canvas.drawPath(path, paint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
