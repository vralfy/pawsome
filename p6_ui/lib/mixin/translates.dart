import 'package:p6_base/translator.dart';

mixin Translates {
  String tr(String? text, {TRANSLATION_CATEGORY category = TRANSLATION_CATEGORY.DEFAULT}) => Translator.tr(text, category: category);
  static String translate(String? text, {TRANSLATION_CATEGORY category = TRANSLATION_CATEGORY.DEFAULT}) => Translator.tr(text, category: category);
}
