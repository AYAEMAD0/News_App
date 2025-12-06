import 'package:flutter/material.dart';

class LoadingBaseWidget extends StatelessWidget {
  const LoadingBaseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: Theme.of(context).canvasColor),
    );
  }
}
