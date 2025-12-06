import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_strings.dart';
import 'button_try_again.dart';

class ErrorBaseWidget extends StatelessWidget {
  final void Function() onPressed;
  final String? message;

  const ErrorBaseWidget({super.key, required this.onPressed, this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      child: Center(
        child: Column(
          spacing: 20.h,
          children: [
            Text(
              message ?? AppStrings.somethingWentWrong,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            ButtonTryAgain(onPressed: onPressed),
          ],
        ),
      ),
    );
  }
}
