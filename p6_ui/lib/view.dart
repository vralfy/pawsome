import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:p6_base/config.dart';
import 'package:p6_ui/mixin/translates.dart';
import 'package:p6_ui/navigation/navbar.dart';
import 'package:p6_ui/navigation/navigationbutton.dart';
import 'package:p6_ui/navigation/sidebar.dart';

class View with Translates {
  static Scaffold _default({
    required BuildContext context,
    required Widget body,
    String title = '',
    List<NavigationButton>? floatingActionButton,
    List<NavigationButton>? bottomNavigation,
  }) {
    return Scaffold(
      appBar: NavigationNavbar(title: 'P6${title.isEmpty ? '' : ':'} ${Translates.translate(title)}'),
      body: body,
      drawer: const NavigationSidebar(),
      floatingActionButton: _floatingActionButtonView(floatingActionButton ?? [], bottomNavigation ?? []),
      floatingActionButtonLocation: _floatingActionButtonLocation(floatingActionButton ?? [], bottomNavigation ?? []),
      bottomNavigationBar: _bottomNavigationView(floatingActionButton ?? [], bottomNavigation ?? []),
      // bottomSheet: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   children: floatingActionButton ?? [],
      // ),
      // persistentFooterButtons: floatingActionButton,
    );
    // ,
    // IconButton(onPressed: () {}, icon: FaIcon(FontAwesomeIcons.cross)),
  }

  static Scaffold main(
    BuildContext context,
    Widget child, {
    double vertical = 5.0,
    double horizontal = 10.0,
    String title = '',
    List<NavigationButton>? floatingActionButton,
    List<NavigationButton>? bottomNavigation,
  }) {
    return _default(
      context: context,
      title: title,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
        child: child,
      ),
      floatingActionButton: floatingActionButton,
      bottomNavigation: bottomNavigation,
    );
  }

  static Scaffold centered(
    BuildContext context,
    Widget child, {
    double vertical = 5.0,
    double horizontal = 10.0,
    String title = '',
    List<NavigationButton>? floatingActionButton,
    List<NavigationButton>? bottomNavigation,
  }) {
    return _default(
      context: context,
      title: title,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
          child: child,
        ),
      ),
      floatingActionButton: floatingActionButton,
      bottomNavigation: bottomNavigation,
    );
  }

  static FloatingActionButtonLocation? _floatingActionButtonLocation(List<NavigationButton> floatingActionButton, List<NavigationButton> bottomNavigation) {
    if (P6Config.instance.featureSpeedDial) {
      return bottomNavigation.isEmpty ? FloatingActionButtonLocation.endFloat : FloatingActionButtonLocation.endDocked;
    }
    return null;
  }

  static MainAxisAlignment _bottomNavigationAlignment(List<NavigationButton> floatingActionButton, List<NavigationButton> bottomNavigation) {
    return floatingActionButton.isEmpty ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.start;
  }

  static Widget? _floatingActionButtonView(List<NavigationButton> floatingActionButton, List<NavigationButton> bottomNavigation) {
    if (floatingActionButton.isEmpty || (floatingActionButton.length < P6Config.instance.minFloatingButtons && bottomNavigation.isNotEmpty)) {
      return null;
    }

    if (P6Config.instance.featureSpeedDial && (floatingActionButton.length > 1 || bottomNavigation.isNotEmpty)) {
      return SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: floatingActionButton
            .map(((e) => SpeedDialChild(
                  onTap: e.onPressed,
                  child: FaIcon(e.icon),
                  backgroundColor: e.color,
                  label: Translates.translate(e.title),
                  // foregroundColor: e.color,
                )))
            .toList(),
      );
    }

    return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: floatingActionButton
            .map((e) => IconButton(
                  onPressed: e.onPressed,
                  icon: FaIcon(e.icon),
                  color: e.color,
                  focusColor: e.color,
                  tooltip: Translates.translate(e.title),
                ))
            .toList());
  }

  static Widget? _bottomNavigationView(List<NavigationButton> floatingActionButton, List<NavigationButton> bottomNavigation) {
    if (bottomNavigation.isEmpty) {
      return null;
    }
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: _bottomNavigationAlignment(floatingActionButton, bottomNavigation),
        children: [
          ...bottomNavigation,
          ...(floatingActionButton.length < P6Config.instance.minFloatingButtons ? floatingActionButton : []),
        ]
            .map((e) => IconButton(
                  onPressed: e.onPressed,
                  icon: FaIcon(e.icon),
                  color: e.color,
                  focusColor: e.color,
                  tooltip: Translates.translate(e.title),
                ))
            .toList(),
      ),
    );
  }
}
