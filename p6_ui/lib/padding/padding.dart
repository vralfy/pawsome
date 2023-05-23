import 'package:flutter/material.dart';
import 'package:p6_ui/widget.dart';

class DefaultPadding extends P6StatelessWidget {
  final Widget child;
  final double? vertical;
  final double? horizontal;
  final double? vertical_multiplier;
  final double? horizontal_multiplier;
  const DefaultPadding({
    Key? key,
    required this.child,
    this.vertical,
    this.horizontal,
    this.vertical_multiplier,
    this.horizontal_multiplier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: (vertical ?? configuration.padding_vertical) * (vertical_multiplier ?? 1),
        horizontal: (horizontal ?? configuration.padding_horizontal) * (horizontal_multiplier ?? 1),
      ),
      child: child,
    );
  }
}
