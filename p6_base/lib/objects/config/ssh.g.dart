// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ssh.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigSSH _$ConfigSSHFromJson(Map<String, dynamic> json) => ConfigSSH(
      user: json['user'] as String? ?? 'root',
      password: json['password'] as String?,
      address: json['address'] as String?,
      port: json['port'] as int? ?? 22,
      key: json['key'] as String?,
    );

Map<String, dynamic> _$ConfigSSHToJson(ConfigSSH instance) => <String, dynamic>{
      'user': instance.user,
      'password': instance.password,
      'key': instance.key,
      'address': instance.address,
      'port': instance.port,
    };
