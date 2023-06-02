import 'dart:io';

import 'package:git/git.dart' as git;
import 'package:p6_base/config.dart';
import 'package:path/path.dart' as path;

class P6GitRepository {
  Future<void> clone() async {
    if (P6Config.instance.directory_current == null) {
      return;
    }
    ProcessResult res = await Process.run('git', ['clone', 'http://gitrepo.de', P6Config.instance.directory_current?.path ?? '.']);
  }
}
