import 'dart:io';

import 'package:p6_base/logger.dart';
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

    try {
      Socket socket = await Socket.connect(config?.address, config?.port ?? 22, timeout: Duration(seconds: config?.interval ?? 5));
      socket.destroy();
      return ONLINE_STATUS.ONLINE;
    } catch (e) {
      Logger.info('$e');
      return ONLINE_STATUS.OFFLINE;
    }
  }
}
