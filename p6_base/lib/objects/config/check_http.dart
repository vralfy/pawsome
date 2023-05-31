import 'package:json_annotation/json_annotation.dart';
import 'package:p6_base/objects/config/check_port.dart';

part 'check_http.g.dart';

@JsonSerializable()
class ConfigCheckHTTP extends ConfigCheckPort {
  @JsonKey(defaultValue: null, disallowNullValue: false)
  final String? path;

  ConfigCheckHTTP({
    required super.interval,
    required super.address,
    required super.port,
    required this.path,
  });

  factory ConfigCheckHTTP.fromJson(Map<String, dynamic> json) => _$ConfigCheckHTTPFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ConfigCheckHTTPToJson(this);
}
