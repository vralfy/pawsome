// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_port.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigCheckPort _$ConfigCheckPortFromJson(Map<String, dynamic> json) =>
    ConfigCheckPort(
      interval: json['interval'] as int?,
      address: json['address'] as String?,
      port: json['port'] as int?,
    );

Map<String, dynamic> _$ConfigCheckPortToJson(ConfigCheckPort instance) =>
    <String, dynamic>{
      'interval': instance.interval,
      'address': instance.address,
      'port': instance.port,
    };
