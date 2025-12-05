import 'package:flutter/material.dart';
import '../constants/app_strings.dart';
import 'button_try_again.dart';
class ErrorBaseWidget extends StatelessWidget {
  final void Function() onPressed;
  const ErrorBaseWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: height*0.03),
      child: Center(
        child: Column(
          spacing: 0.03*height,
          children: [
            Text(
              AppStrings.somethingWentWrong,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            ButtonTryAgain(onPressed: onPressed),
          ],
        ),
      ),
    );
  }
}
