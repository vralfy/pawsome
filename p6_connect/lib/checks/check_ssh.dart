import 'dart:io';

import 'package:p6_base/logger.dart';
import 'package:p6_base/objects/config/check_ssh.dart';
import 'package:p6_connect/checks/check_port.dart';
import 'package:p6_connect/checks/online_status.dart';

class OnlineCheckSSH extends OnlineCheckPort {
  OnlineCheckSSH({required super.config});
  ConfigCheckSSH? get _config => config as ConfigCheckSSH;

  @override
  Future<ONLINE_STATUS> check() async {
    if (config == null) {
      return ONLINE_STATUS.UNKNOWN;
    }

    try {
      Socket socket = await Socket.connect(_config?.address, _config?.port ?? 22, timeout: Duration(seconds: _config?.interval ?? 5));
      socket.destroy();
      return ONLINE_STATUS.ONLINE;
    } catch (e) {
      Logger.info('$e');
      return ONLINE_STATUS.OFFLINE;
    }
  }
}
