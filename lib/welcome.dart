import 'package:flutter/material.dart';
import 'package:p6_ui/headline/headline.dart';
import 'package:p6_ui/view.dart';
import 'package:p6_ui/widget.dart';

class Welcome extends P6StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return View.main(
      context,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Headline1(text: 'Pawsome Programmable Personal Penguin Patch Patrol'),
              Text('${configuration.application_version} (${configuration.application_build})'),
              Text(configuration.theme),
              // Text(configuration.themes.last),
            ],
          ),
        ],
      ),
    );
  }
}
