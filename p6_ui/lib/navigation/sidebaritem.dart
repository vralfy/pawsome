import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:p6_ui/navigation/isidebaritem.dart';

class NavigationSidebarItem extends ISidebarItem {
  final String route;

  const NavigationSidebarItem({
    Key? key,
    required super.title,
    super.icon = FontAwesomeIcons.question,
    super.enabled = true,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(tr(title)),
      leading: FaIcon(icon),
      onTap: () {
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushNamed(context, route);
      },
    );
  }
}
