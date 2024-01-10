import 'package:flutter/material.dart';

import '../utils/colors.dart';

Widget primaryButton({
  required String title,
  // required double height,
  //required double width,
  required void Function() onPressed,
}) {
  return Row(
    children: [
      Expanded(
        child: Center(
          child: ElevatedButton(
            style: ButtonStyle(
              minimumSize: const MaterialStatePropertyAll(
                Size.fromHeight(50),
              ),
              // Set the button's height.
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              alignment: Alignment.center,
              backgroundColor: MaterialStatePropertyAll(AppColors.primary),
            ),
            onPressed: onPressed,
            child: Text(
              title,
              style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    ],
  );
}
