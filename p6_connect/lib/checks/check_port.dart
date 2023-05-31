import 'package:p6_base/objects/config/check_port.dart';
import 'package:p6_connect/checks/abstract_check.dart';
import 'package:p6_connect/checks/online_status.dart';

class OnlineCheckPort extends AbstractOnlineCheck {
  final ConfigCheckPort? config;

  OnlineCheckPort({required this.config});

  @override
  Future<ONLINE_STATUS> check() async {
    if (config == null) {
      return ONLINE_STATUS.UNKNOWN;
    }
    return ONLINE_STATUS.UNKNOWN;
  }
}
