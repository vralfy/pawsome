import 'package:p6_base/config.dart';
import 'package:p6_base/logger.dart';
import 'package:p6_ui/navigation/sidebaritem.dart';

class P6NavigationItems {
  static populate() {
    Logger.info('Populating menue');
    P6Config.instance.navbarItems = () {
      return [
        const NavigationSidebarItem(title: 'Home', route: '/'),
      ];
    };
  }
}
