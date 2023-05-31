import 'package:p6_connect/checks/online_status.dart';

abstract class AbstractOnlineCheck {
  Future<ONLINE_STATUS> check();
}
