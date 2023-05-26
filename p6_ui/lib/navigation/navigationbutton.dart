import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:p6_base/config.dart';

class NavigationButton {
  static refresh({
    required void Function()? onPressed,
    IconData icon = FontAwesomeIcons.arrowsRotate,
    Color? color,
    String? title = 'Refresh',
  }) {
    return NavigationButton(onPressed: onPressed, icon: icon, color: (color ?? P6Config.instance.colorSecondary), title: title);
  }

  static back({
    required void Function()? onPressed,
    IconData icon = FontAwesomeIcons.arrowRotateLeft,
    Color? color,
    String? title = 'Back',
  }) {
    return NavigationButton(onPressed: onPressed, icon: icon, color: (color ?? P6Config.instance.colorSecondary), title: title);
  }

  static cancel({
    required void Function()? onPressed,
    IconData icon = FontAwesomeIcons.xmark,
    Color? color,
    String? title = 'Cancel',
  }) {
    return NavigationButton(onPressed: onPressed, icon: icon, color: (color ?? P6Config.instance.colorSecondary), title: title);
  }

  final Function()? onPressed;
  final IconData icon;
  final Color? color;
  final String? title;

  NavigationButton({
    this.onPressed,
    this.icon = FontAwesomeIcons.question,
    this.color,
    this.title,
  });
}


  // static NavigationButton actionButton({
  //   required void Function()? onPressed,
  //   IconData icon = FontAwesomeIcons.question,
  //   Color color = Constants.color_info,
  //   String? title,
  // }) {


  //   if (Constants.feature_speed_dial) {
  //     return SpeedDialChild();
  //   }

  //   if (title == null) {
  //     return IconButton(
  //       onPressed: onPressed,
  //       icon: FaIcon(icon),
  //       color: color,
  //       focusColor: color,
  //       tooltip: title,
  //     );
  //   }

  //   return FloatingActionButton.small(
  //     heroTag: title,
  //     onPressed: onPressed,
  //     backgroundColor: color,
  //     tooltip: title,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.end,
  //       children: [Text(title), FaIcon(icon)],
  //     ),
  //   );
  // }
