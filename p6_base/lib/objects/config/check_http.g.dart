// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_http.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigCheckHTTP _$ConfigCheckHTTPFromJson(Map<String, dynamic> json) =>
    ConfigCheckHTTP(
      interval: json['interval'] as int?,
      address: json['address'] as String?,
      port: json['port'] as int?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$ConfigCheckHTTPToJson(ConfigCheckHTTP instance) =>
    <String, dynamic>{
      'interval': instance.interval,
      'address': instance.address,
      'port': instance.port,
      'path': instance.path,
    };
