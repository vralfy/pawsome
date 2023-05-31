import 'package:flutter/material.dart';
import 'package:p6_ui/widget.dart';

class DefaultPadding extends P6StatelessWidget {
  final Widget child;
  final double? vertical;
  final double? horizontal;
  final double? verticalMultiplier;
  final double? horizontalMultiplier;
  const DefaultPadding({
    Key? key,
    required this.child,
    this.vertical,
    this.horizontal,
    this.verticalMultiplier,
    this.horizontalMultiplier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: (vertical ?? configuration.paddingVertical) * (verticalMultiplier ?? 1),
        horizontal: (horizontal ?? configuration.paddingHorizontal) * (horizontalMultiplier ?? 1),
      ),
      child: child,
    );
  }
}
