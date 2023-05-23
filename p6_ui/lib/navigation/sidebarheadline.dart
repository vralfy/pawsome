import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:p6_base/config.dart';
import 'package:p6_ui/navigation/isidebaritem.dart';

class NavigationSidebarHeadline extends ISidebarItem {
  final List<ISidebarItem>? children;
  const NavigationSidebarHeadline({
    Key? key,
    required super.title,
    super.icon = FontAwesomeIcons.question,
    super.enabled = true,
    this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget caption = ListTile(
      title: Text(
        tr(title),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      leading: FaIcon(icon),
    );

    if (!P6Config.instance.feature_expandable_navigation) {
      return caption;
    }
    return ExpandablePanel(
      header: caption,
      collapsed: Column(),
      expanded: Column(
        children: (children ?? []).where((c) => c.enabled).toList(),
      ),
    );
  }

  List<ISidebarItem> get subMenu {
    return P6Config.instance.feature_expandable_navigation ? [] : (children ?? []);
  }
}
