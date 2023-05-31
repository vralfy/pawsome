import 'package:p6_base/objects/config/check_ssh.dart';
import 'package:p6_connect/checks/abstract_check.dart';
import 'package:p6_connect/checks/online_status.dart';

class OnlineCheckSSH extends AbstractOnlineCheck {
  final ConfigCheckSSH? config;

  OnlineCheckSSH({required this.config});

  @override
  Future<ONLINE_STATUS> check() async {
    if (config == null) {
      return ONLINE_STATUS.UNKNOWN;
    }
    return ONLINE_STATUS.UNKNOWN;
  }
}
