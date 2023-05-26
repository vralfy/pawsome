// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigCheck _$ConfigCheckFromJson(Map<String, dynamic> json) => ConfigCheck(
      port: json['port'] == null
          ? null
          : ConfigCheckPort.fromJson(json['port'] as Map<String, dynamic>),
      http: json['http'] == null
          ? null
          : ConfigCheckHTTP.fromJson(json['http'] as Map<String, dynamic>),
      https: json['https'] == null
          ? null
          : ConfigCheckHTTP.fromJson(json['https'] as Map<String, dynamic>),
      ssh: json['ssh'] == null
          ? null
          : ConfigCheckSSH.fromJson(json['ssh'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConfigCheckToJson(ConfigCheck instance) =>
    <String, dynamic>{
      'port': instance.port,
      'http': instance.http,
      'https': instance.https,
      'ssh': instance.ssh,
    };
