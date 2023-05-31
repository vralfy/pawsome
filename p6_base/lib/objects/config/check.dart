import 'package:json_annotation/json_annotation.dart';
import 'package:p6_base/objects/abstract.dart';
import 'package:p6_base/objects/config/check_http.dart';
import 'package:p6_base/objects/config/check_https.dart';
import 'package:p6_base/objects/config/check_port.dart';
import 'package:p6_base/objects/config/check_ssh.dart';

part 'check.g.dart';

@JsonSerializable()
class ConfigCheck extends AbstractObject {
  @JsonKey(defaultValue: null, disallowNullValue: false)
  final int? interval;
  @JsonKey(defaultValue: null, disallowNullValue: false)
  final ConfigCheckPort? port;
  @JsonKey(defaultValue: null, disallowNullValue: false)
  final ConfigCheckHTTP? http;
  @JsonKey(defaultValue: null, disallowNullValue: false)
  final ConfigCheckHTTPS? https;
  @JsonKey(defaultValue: null, disallowNullValue: false)
  final ConfigCheckSSH? ssh;

  ConfigCheck({
    required this.interval,
    required this.port,
    required this.http,
    required this.https,
    required this.ssh,
  });

  factory ConfigCheck.fromJson(Map<String, dynamic> json) => _$ConfigCheckFromJson(json);
  Map<String, dynamic> toJson() => _$ConfigCheckToJson(this);
}
