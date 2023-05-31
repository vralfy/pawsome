import 'package:p6_base/config/from_json.dart';
import 'package:p6_base/objects/config/host.dart';

mixin ConfigRemoteHosts on ConfigFromJSON {
  List<ConfigHost> get remoteHosts => (getByPath(str: 'hosts', defaultValue: [], config: jsonFiles['hosts']?.content) as List<dynamic>).map((e) => ConfigHost.fromJson(e)).toList();
}
