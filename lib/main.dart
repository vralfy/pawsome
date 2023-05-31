import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:p6/hosts.dart';
import 'package:p6/loading.dart';
import 'package:p6/navigation.dart';
import 'package:p6/welcome.dart';
import 'package:p6_base/config.dart';
import 'package:p6_base/logger.dart';
import 'package:p6_ui/themes.dart';
import 'package:p6_ui/widget.dart';

import 'errorhandler.dart';

Future<void> main() async {
  await ErrorHandler.initialize();
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    ErrorHandler.onErrorDetails(details);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    ErrorHandler.onError(error, stack);
    return true;
  };
  runApp(const P6Main());
}

class P6Main extends P6StatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey(debugLabel: 'navKey');
  const P6Main({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => P6MainState();
}

class P6MainState extends P6State<P6Main> {
  @override
  refresh() {
    if (configuration.loaded) {
      P6NavigationItems.populate();
    }
  }

  @override
  void initState() {
    Logger.info('starting main app');
    P6Config.refreshApp = refresh;
    P6Config.onConfigLoaded = () {
      Future.delayed(const Duration(seconds: 1)).whenComplete(() => setState(() {
            P6Main.navigatorKey.currentState?.pushNamed(configuration.defaultRoute);
          }));
      P6Config.refreshApp();
    };
    configuration.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'P6',
      theme: Themes.config,
      navigatorKey: P6Main.navigatorKey,
      initialRoute: '/loading',
      builder: (context, child) => ErrorHandler.builder(context, child),
      routes: {
        '/': (context) => const Welcome(),
        '/loading': (context) => const Loading(),
        '/hosts': (context) => const Hosts(),
        '/error': (context) => const ErrorHandler(),
      },
    );
  }
}
