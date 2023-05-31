import 'package:flutter/material.dart';
import 'package:p6_ui/navigation/isidebaritem.dart';
import 'package:p6_ui/navigation/sidebarheadline.dart';
import 'package:p6_ui/widget.dart';

class NavigationSidebar extends P6StatefulWidget {
  const NavigationSidebar({Key? key}) : super(key: key);

  @override
  NavigationSidebarState createState() => NavigationSidebarState();
}

class NavigationSidebarState extends P6State<NavigationSidebar> {
  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];

    configuration.navbarItems().where((item) => item is ISidebarItem ? item.enabled : true).forEach((item) {
      items.add(const Divider());
      items.add(item);
      if (item is NavigationSidebarHeadline) {
        items.addAll(item.subMenu.where((sub) => sub.enabled).toList());
      }
    });

    return ListView(
      controller: ScrollController(),
      children: items,
    );
  }
}
