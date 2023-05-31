import 'package:json_annotation/json_annotation.dart';
import 'package:p6_base/objects/abstract.dart';

part 'check_port.g.dart';

@JsonSerializable()
class ConfigCheckPort extends AbstractObject {
  @JsonKey(defaultValue: null, disallowNullValue: false)
  final int? interval;
  @JsonKey(defaultValue: null, disallowNullValue: false)
  final String? address;
  @JsonKey(defaultValue: null, disallowNullValue: false)
  final int? port;

  ConfigCheckPort({
    required this.interval,
    required this.address,
    required this.port,
  });

  factory ConfigCheckPort.fromJson(Map<String, dynamic> json) => _$ConfigCheckPortFromJson(json);
  Map<String, dynamic> toJson() => _$ConfigCheckPortToJson(this);
}
