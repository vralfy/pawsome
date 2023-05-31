import 'package:json_annotation/json_annotation.dart';
import 'package:p6_base/objects/config/check_http.dart';

part 'check_https.g.dart';

@JsonSerializable()
class ConfigCheckHTTPS extends ConfigCheckHTTP {
  ConfigCheckHTTPS({
    required super.interval,
    required super.address,
    required super.port,
    required super.path,
  });

  factory ConfigCheckHTTPS.fromJson(Map<String, dynamic> json) => _$ConfigCheckHTTPSFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ConfigCheckHTTPSToJson(this);
}
