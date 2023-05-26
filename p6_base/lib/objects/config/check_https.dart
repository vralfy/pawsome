import 'package:json_annotation/json_annotation.dart';
import 'package:p6_base/objects/config/check_port.dart';

part 'check_https.g.dart';

@JsonSerializable()
class ConfigCheckHTTPS extends ConfigCheckPort {
  ConfigCheckHTTPS({
    required super.address,
    required super.port,
  });

  factory ConfigCheckHTTPS.fromJson(Map<String, dynamic> json) => _$ConfigCheckHTTPSFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ConfigCheckHTTPSToJson(this);
}
