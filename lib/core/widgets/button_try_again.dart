import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_strings.dart';
import '../theme/app_colors.dart';

class ButtonTryAgain extends StatelessWidget {
  final void Function() onPressed;
  const ButtonTryAgain({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.gray,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 14.w),
      ),
      child: Text(
        AppStrings.tryAgain,
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}
