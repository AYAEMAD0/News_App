import 'package:flutter/material.dart';

import '../../../../domain/entities/source/sources.dart';

class SourceName extends StatelessWidget {
  final Sources sources;
  final bool isSelected;
  const SourceName({
    super.key,
    required this.sources,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      sources.name ?? "",
      style: isSelected
          ? Theme.of(context).textTheme.labelMedium
          : Theme.of(context).textTheme.labelSmall,
    );
  }
}
