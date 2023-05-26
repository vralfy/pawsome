import 'package:p6_base/objects/config/check.dart';
import 'package:p6_connect/checks/abstract_check.dart';
import 'package:p6_connect/checks/check_port.dart';
import 'package:p6_connect/checks/online_status.dart';

class OnlineCheck extends AbstractOnlineCheck {
  final ConfigCheck? config;

  OnlineCheck({required this.config});

  @override
  Future<ONLINE_STATUS> check() async {
    var ret = ONLINE_STATUS.UNKNOWN;
    if (config == null) {
      return ret;
      // return Random().nextInt(100) > 50 ? ONLINE_STATUS.OFFLINE : ONLINE_STATUS.ONLINE;
    }

    await Future.forEach([
      {'config': config?.port, 'checker': OnlineCheckPort(config: config?.port)},
    ], (element) async {
      if (element['config'] != null && ret != ONLINE_STATUS.OFFLINE) {
        ONLINE_STATUS check = await (element['checker'] as AbstractOnlineCheck).check();
        ret = check != ONLINE_STATUS.UNKNOWN ? check : ret;
      }
    });

    return ret;
  }
}
