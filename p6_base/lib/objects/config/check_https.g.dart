// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_https.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigCheckHTTPS _$ConfigCheckHTTPSFromJson(Map<String, dynamic> json) =>
    ConfigCheckHTTPS(
      interval: json['interval'] as int?,
      address: json['address'] as String?,
      port: json['port'] as int?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$ConfigCheckHTTPSToJson(ConfigCheckHTTPS instance) =>
    <String, dynamic>{
      'interval': instance.interval,
      'address': instance.address,
      'port': instance.port,
      'path': instance.path,
    };
