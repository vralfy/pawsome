import 'package:http/http.dart' as http;
import 'package:p6_base/logger.dart';
import 'package:p6_base/objects/config/check_http.dart';
import 'package:p6_connect/checks/abstract_check.dart';
import 'package:p6_connect/checks/online_status.dart';

class OnlineCheckHTTP extends AbstractOnlineCheck {
  final ConfigCheckHTTP? config;

  OnlineCheckHTTP({required this.config});

  Uri get uri {
    return Uri.parse('http://${config?.address}:${config?.port ?? 80}${config?.path ?? ''}');
  }

  @override
  Future<ONLINE_STATUS> check() async {
    ONLINE_STATUS ret = ONLINE_STATUS.UNKNOWN;
    if (config == null) {
      return ret;
    }

    Logger.debug('Checking $uri');

    return await http
        .head(uri) //
        .then((value) => value.statusCode >= 200 && value.statusCode < 400 ? ONLINE_STATUS.ONLINE : ONLINE_STATUS.OFFLINE)
        .onError(
      (error, stackTrace) {
        Logger.error('$error - $stackTrace');
        return ONLINE_STATUS.OFFLINE;
      },
    );
  }
}
