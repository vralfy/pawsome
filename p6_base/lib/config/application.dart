import 'package:p6_base/config/from_package.dart';

mixin ConfigApplication on ConfigFromPackage {
  String get applicationName => packageInfo?.appName ?? 'P6';
  String get applicationPackage => packageInfo?.packageName ?? 'de.p6';
  String get applicationVersion => packageInfo?.version ?? '0.0.0';
  String get applicationBuild => packageInfo?.buildNumber ?? '0';
  String get applicationSignature => packageInfo?.buildSignature ?? 'unknown';
  String get applicationStore => packageInfo?.installerStore ?? 'unknown';
}
