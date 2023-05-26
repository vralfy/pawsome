// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'host.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigHost _$ConfigHostFromJson(Map<String, dynamic> json) => ConfigHost(
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      tag: (json['tag'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          [],
      address: json['address'] as String? ?? '',
      ssh: json['ssh'] == null
          ? null
          : ConfigSSH.fromJson(json['ssh'] as Map<String, dynamic>),
      check: json['check'] == null
          ? null
          : ConfigCheck.fromJson(json['check'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConfigHostToJson(ConfigHost instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'tag': instance.tag,
      'address': instance.address,
      'ssh': instance.ssh,
      'check': instance.check,
    };
