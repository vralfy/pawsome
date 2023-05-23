import 'package:p6_base/config/from_package.dart';

mixin ConfigApplication on ConfigFromPackage {
  String get application_name => packageInfo?.appName ?? 'P6';
  String get application_package => packageInfo?.packageName ?? 'de.p6';
  String get application_version => packageInfo?.version ?? '0.0.0';
  String get application_build => packageInfo?.buildNumber ?? '0';
  String get application_signature => packageInfo?.buildSignature ?? 'unknown';
  String get application_store => packageInfo?.installerStore ?? 'unknown';
}
