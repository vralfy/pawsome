import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:p6_base/config.dart';
import 'package:p6_base/logger.dart';
import 'package:p6_ui/padding/padding.dart';
import 'package:p6_ui/widget.dart';

class ErrorHandler extends P6StatelessWidget {
  static builder(BuildContext context, Widget? child) {
    Widget errorWidget = _getErrorDisplayWidget();
    if (child is Scaffold || child is Navigator) {
      errorWidget = Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Center(child: errorWidget),
        ),
      );
    }

    ErrorWidget.builder = (details) => errorWidget;
    if (child != null) return child;
    throw ('Widget to display the Error is null');
  }

  static initialize() async {}
  static onErrorDetails(FlutterErrorDetails details) {
    // Logger.error('FlutterErrorDetails: ${details}');
  }

  static onError(Object error, StackTrace stack) {
    // Logger.error('Error: ${error}');
    // Logger.error('Stack: ${stack}');
  }

  static Widget _getErrorDisplayWidget() {
    return Column(
      children: [
        DefaultPadding(
          child: FaIcon(
            FontAwesomeIcons.circleXmark,
            color: P6Config.instance.color_danger,
            size: 50,
          ),
        ),
        const Text('... UUPSIE ...'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Center(child: ErrorHandler._getErrorDisplayWidget()),
      ),
    );
  }
}
