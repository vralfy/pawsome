// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_ssh.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigCheckSSH _$ConfigCheckSSHFromJson(Map<String, dynamic> json) =>
    ConfigCheckSSH(
      interval: json['interval'] as int?,
      address: json['address'] as String?,
      port: json['port'] as int?,
    );

Map<String, dynamic> _$ConfigCheckSSHToJson(ConfigCheckSSH instance) =>
    <String, dynamic>{
      'interval': instance.interval,
      'address': instance.address,
      'port': instance.port,
    };
