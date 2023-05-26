import 'package:p6_base/objects/config/check_https.dart';
import 'package:p6_connect/checks/abstract_check.dart';
import 'package:p6_connect/checks/online_status.dart';

class OnlineCheckHTTPS extends AbstractOnlineCheck {
  final ConfigCheckHTTPS? config;

  OnlineCheckHTTPS({required this.config});

  @override
  Future<ONLINE_STATUS> check() async {
    if (config == null) {
      return ONLINE_STATUS.UNKNOWN;
    }
    return ONLINE_STATUS.UNKNOWN;
  }
}
