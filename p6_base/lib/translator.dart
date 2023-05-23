import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:p6_base/config.dart';

import 'logger.dart';

enum TRANSLATION_CATEGORY {
  DEFAULT,
}

class Translator {
  static Map<String, Map<String, String>> _translation = {};
  static load({String? language}) async {
    language = language ?? P6Config.instance.language;
    Logger.debug('[i18n] Loading $language.json');
    try {
      await rootBundle.loadString('assets/json/i18n/$language.json').then((value) {
        Logger.debug('[i18n] Loaded $language.json');
        Logger.trace('[i18n] $value');

        Translator._translation = (jsonDecode(value) as Map<String, dynamic>).map(
          (key, value) => MapEntry(
            key,
            (value as Map<String, dynamic>).map(
              (key, value) => MapEntry(key, '$value'),
            ),
          ),
        );
      });
    } catch (e) {
      Logger.warn('[i18n] Unable to load $language.json');
      Logger.warn('$e');
    }
  }

  static String tr(dynamic text, {TRANSLATION_CATEGORY category = TRANSLATION_CATEGORY.DEFAULT}) {
    if (text == null || text.isEmpty) {
      return '';
    }
    String defaultText = '$text';
    // defaultText = 'MISSING: ${category.name}|$text';
    if (Translator._translation.containsKey(category.name.toLowerCase()) //
        &&
        (Translator._translation[category.name.toLowerCase()]?.containsKey('$text') ?? false)) {
      return Translator._translation[category.name.toLowerCase()]?['$text'] ?? defaultText;
    } else {
      Translator._translation[category.name.toLowerCase()]?['$text'] = defaultText;
      Logger.trace('[i18n] No translation found for "$text" in ${category.name}');
    }

    return Translator._translation[category.name.toLowerCase()]?['$text'] ?? defaultText;
  }
}
