import 'package:json_annotation/json_annotation.dart';
import 'package:p6_base/objects/abstract.dart';

part 'host.g.dart';

@JsonSerializable()
class ConfigHost extends AbstractObject {
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: '')
  final String description;
  @JsonKey(defaultValue: '')
  final String address;

  ConfigHost({
    required this.name,
    required this.description,
    required this.address,
  });

  factory ConfigHost.fromJson(Map<String, dynamic> json) => _$ConfigHostFromJson(json);
  Map<String, dynamic> toJson() => _$ConfigHostToJson(this);
}
