import 'package:p6_base/objects/config/check_https.dart';
import 'package:p6_connect/checks/check_http.dart';

class OnlineCheckHTTPS extends OnlineCheckHTTP {
  OnlineCheckHTTPS({required super.config});
  ConfigCheckHTTPS? get _config => super.config as ConfigCheckHTTPS;

  @override
  Uri get uri {
    return Uri.parse('https://${_config?.address}:${_config?.port ?? 443}${_config?.path ?? ''}');
  }
}
