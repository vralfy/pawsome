import 'dart:io';
import 'package:p6_base/logger.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

mixin ConfigDirectory {
  Directory? directory_current;
  Directory? directory_documents;
  Directory? directory_download;
  Directory? directory_external;
  Directory? directory_library;
  Directory? directory_support;
  Directory? directory_temporary;

  locateSystemDirectories() async {
    try {
      directory_current = Directory(p.current);
    } catch (_) {
      Logger.debug('[config] unable locate current directory');
    }

    try {
      directory_documents = await getApplicationDocumentsDirectory();
    } catch (_) {
      Logger.debug('[config] unable locate document directory');
    }

    try {
      directory_download = await getDownloadsDirectory();
    } catch (_) {
      Logger.debug('[config] unable locate download directory');
    }

    try {
      directory_external = await getExternalStorageDirectory();
    } catch (_) {
      Logger.debug('[config] unable locate temporary directory');
    }

    try {
      directory_library = await getLibraryDirectory();
    } catch (_) {
      Logger.debug('[config] unable locate library directory');
    }

    try {
      directory_support = await getApplicationSupportDirectory();
    } catch (_) {
      Logger.debug('[config] unable locate support directory');
    }

    try {
      directory_temporary = await getTemporaryDirectory();
    } catch (_) {
      Logger.debug('[config] unable locate temporary directory');
    }
  }
}
