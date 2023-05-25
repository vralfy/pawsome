import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:p6_base/config.dart';
import 'package:p6_base/logger.dart';
import 'package:p6_ui/navigation/sidebaritem.dart';

class P6NavigationItems {
  static populate() {
    Logger.info('Populating menue');
    P6Config.instance.navbarItems = () {
      return [
        const NavigationSidebarItem(title: 'Home', route: '/', icon: FontAwesomeIcons.house),
        const NavigationSidebarItem(title: 'Hosts', route: '/hosts', icon: FontAwesomeIcons.computer),
        const NavigationSidebarItem(title: 'Errors', route: '/error'),
      ];
    };
  }
}
