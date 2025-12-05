import 'package:flutter/material.dart';
import '../constants/app_strings.dart';
import '../theme/app_colors.dart';

class ButtonTryAgain extends StatelessWidget {
  final void Function() onPressed;
  const ButtonTryAgain({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.gray,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.symmetric(
          vertical: 0.015 * height,
          horizontal: 0.03 * width,
        ),
      ),
      child: Text(
        AppStrings.tryAgain,
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}
