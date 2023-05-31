import 'package:flutter/material.dart';
import 'package:p6_ui/widget.dart';

class LoadingIndicator extends P6StatefulWidget {
  const LoadingIndicator({super.key});

  @override
  State<StatefulWidget> createState() => LoadingIndicatorState();
}

class LoadingIndicatorState extends P6State<LoadingIndicator> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: controller.value,
      semanticsLabel: 'Loading',
    );
  }
}
