import 'package:flutter/material.dart';
import 'package:p6_base/objects/config/check.dart';
import 'package:p6_connect/checks/online_check.dart';
import 'package:p6_connect/checks/online_status.dart';
import 'package:p6_ui/widget.dart';

class HostOnlineIndicator extends P6StatefulWidget {
  final ConfigCheck? config;

  const HostOnlineIndicator({super.key, required this.config});

  @override
  State<StatefulWidget> createState() => HostOnlineIndicatorState();
}

class HostOnlineIndicatorState extends P6State<HostOnlineIndicator> with TickerProviderStateMixin {
  late AnimationController controller;
  ONLINE_STATUS status = ONLINE_STATUS.UNKNOWN;

  checkStatus() async {
    while (true) {
      await Future.delayed(const Duration(seconds: 5), () {
        setState(() {
          status = ONLINE_STATUS.UNKNOWN;
        });
        OnlineCheck(config: widget.config).check().then((value) => status = value);
      });
    }
  }

  @override
  void initState() {
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: false);
    checkStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: status == ONLINE_STATUS.UNKNOWN ? controller.value : 1,
      color: () {
        switch (status) {
          case ONLINE_STATUS.ONLINE:
            return configuration.colorSuccess;
          case ONLINE_STATUS.OFFLINE:
            return configuration.colorDanger;
          default:
            return configuration.colorInfo;
        }
      }(),
    );
  }
}
