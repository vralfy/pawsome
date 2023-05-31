abstract class AbstractObject {
  DateTime parseDateTimeFromString(String str) {
    DateTime fromTimestamp = DateTime.fromMillisecondsSinceEpoch((int.tryParse(str) ?? 0) * 1000);
    return int.tryParse(str) == null ? (DateTime.tryParse(str) ?? fromTimestamp) : fromTimestamp;
  }

  static String json2String(dynamic v) => '$v';
  static int json2Int(dynamic v) => v == null ? 0 : int.parse(json2String(v));
  static double json2Double(dynamic v) => v == null ? 0 : double.parse(json2String(v).replaceAll(',', '.'));
  static bool json2Bool(dynamic v) => ['y', 'yes', '1', 'true'].contains(json2String(v).toLowerCase());

  static String? json2NullableString(dynamic v) => v == null ? null : '$v';
  static int? json2NullableInt(dynamic v) => v == null ? null : int.parse(json2String(v));
  static double? json2NullableDouble(dynamic v) => v == null ? null : double.parse(json2String(v).replaceAll(',', '.'));
  static bool? json2NullableBool(dynamic v) => v == null ? null : ['y', 'yes', '1', 'true'].contains(json2String(v).toLowerCase());

  static List<String> json2StringList(List<dynamic>? l) => l == null ? [] : l.map((v) => json2String(v)).toList();
  static List<int> json2IntList(List<dynamic>? l) => json2StringList(l).map((v) => json2Int(v)).toList();
  static List<double> json2DoubleList(List<dynamic>? l) => json2StringList(l).map((v) => json2Double(v)).toList();
  static List<bool> json2BoolList(List<dynamic>? l) => json2StringList(l).map((v) => json2Bool(v)).toList();

  static List<String> json2UniqueStringList(List<dynamic>? l) => json2StringList(l).toSet().toList();
  static List<int> json2UniqueIntList(List<dynamic>? l) => json2IntList(l).toSet().toList();
  static List<double> json2UniqueDoubleList(List<dynamic>? l) => json2DoubleList(l).toSet().toList();
  static List<bool> json2UniqueBoolList(List<dynamic>? l) => json2BoolList(l).toSet().toList();

  static List<String?> json2NullableStringList(List<dynamic>? l) => l == null ? [] : l.map((v) => json2NullableString(v)).toList();
  static List<int?> json2NullableIntList(List<dynamic>? l) => json2NullableStringList(l).map((v) => json2NullableInt(v)).toList();
  static List<double?> json2NullableDoubleList(List<dynamic>? l) => json2NullableStringList(l).map((v) => json2NullableDouble(v)).toList();
  static List<bool?> json2NullableBoolList(List<dynamic>? l) => json2NullableStringList(l).map((v) => json2NullableBool(v)).toList();

  static List<String?> json2UniqueNullableStringList(List<dynamic>? l) => json2NullableStringList(l).toSet().toList();
  static List<int?> json2UniqueNullableIntList(List<dynamic>? l) => json2NullableIntList(l).toSet().toList();
  static List<double?> json2UniqueNullableDoubleList(List<dynamic>? l) => json2NullableDoubleList(l).toSet().toList();
  static List<bool?> json2UniqueNullableBoolList(List<dynamic>? l) => json2NullableBoolList(l).toSet().toList();
}
