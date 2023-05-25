import 'package:json_annotation/json_annotation.dart';
import 'package:p6_base/objects/abstract.dart';
import 'package:p6_base/objects/config/ssh.dart';

part 'host.g.dart';

@JsonSerializable()
class ConfigHost extends AbstractObject {
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: '')
  final String description;
  @JsonKey(defaultValue: [])
  final List<String> tag;
  @JsonKey(defaultValue: '')
  final String address;
  @JsonKey(defaultValue: null, disallowNullValue: false)
  final ConfigSSH? ssh;

  ConfigHost({
    required this.name,
    required this.description,
    required this.tag,
    required this.address,
    required this.ssh,
  });

  factory ConfigHost.fromJson(Map<String, dynamic> json) => _$ConfigHostFromJson(json);
  Map<String, dynamic> toJson() => _$ConfigHostToJson(this);
}
