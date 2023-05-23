// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'host.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigHost _$ConfigHostFromJson(Map<String, dynamic> json) => ConfigHost(
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      address: json['address'] as String? ?? '',
    );

Map<String, dynamic> _$ConfigHostToJson(ConfigHost instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'address': instance.address,
    };
