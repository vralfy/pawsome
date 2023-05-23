import 'package:flutter/material.dart';

class ErrorHandler {
  static builder(BuildContext context, Widget? child) {
    Widget errorWidget = const Text('... UUPSIE ...');
    if (child is Scaffold || child is Navigator) {
      errorWidget = Scaffold(body: Center(child: errorWidget));
    }

    ErrorWidget.builder = (details) => errorWidget;
    if (child != null) return child;
    throw ('Widget to display the Error is null');
  }

  static initialize() async {}
  static onErrorDetails(FlutterErrorDetails details) {}
  static onError(Object error, StackTrace stack) {}
}
