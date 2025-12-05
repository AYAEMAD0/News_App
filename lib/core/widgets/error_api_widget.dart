import 'package:flutter/material.dart';

import 'button_try_again.dart';

class ErrorApiWidget extends StatelessWidget {
  final void Function() onPressed;
  final String message;
  const ErrorApiWidget({
    super.key,
    required this.onPressed,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: height*0.03),
      child: Center(
        child: Column(
          spacing: 0.03 * height,
          children: [
            Text(message, style: Theme.of(context).textTheme.labelMedium),
            ButtonTryAgain(onPressed: onPressed),
          ],
        ),
      ),
    );
  }
}
