import 'package:json_annotation/json_annotation.dart';
import 'package:p6_base/objects/config/check_port.dart';

part 'check_ssh.g.dart';

@JsonSerializable()
class ConfigCheckSSH extends ConfigCheckPort {
  ConfigCheckSSH({
    required super.interval,
    required super.address,
    required super.port,
  });

  factory ConfigCheckSSH.fromJson(Map<String, dynamic> json) => _$ConfigCheckSSHFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ConfigCheckSSHToJson(this);
}
