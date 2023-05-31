import 'package:json_annotation/json_annotation.dart';
import 'package:p6_base/objects/abstract.dart';

part 'ssh.g.dart';

@JsonSerializable()
class ConfigSSH extends AbstractObject {
  @JsonKey(defaultValue: 'root')
  final String user;
  @JsonKey(defaultValue: null, disallowNullValue: false)
  final String? password;
  @JsonKey(defaultValue: null, disallowNullValue: false)
  final String? key;
  @JsonKey(defaultValue: null, disallowNullValue: false)
  final String? address;
  @JsonKey(defaultValue: 22, disallowNullValue: false)
  final int? port;

  ConfigSSH({
    required this.user,
    required this.password,
    required this.address,
    required this.port,
    required this.key,
  });

  factory ConfigSSH.fromJson(Map<String, dynamic> json) => _$ConfigSSHFromJson(json);
  Map<String, dynamic> toJson() => _$ConfigSSHToJson(this);
}
