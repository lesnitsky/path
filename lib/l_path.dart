import 'dart:io';

import 'package:l_cli/command.dart';
import 'package:path/path.dart';

class PathCommand extends Command {
  PathCommand() : super('path', 'Adds cwd to path');

  @override
  Future<void> exec(List<String> args) async {
    final cdir = Directory.current;
    final pathToAdd = joinAll([cdir.path, ...args]);

    final home = Platform.environment['HOME'];
    final zshrc = File(join(home, '.zshrc'));

    if (zshrc.existsSync()) {
      final w = zshrc.openWrite(mode: FileMode.append);
      final str = 'export PATH=\$PATH:$pathToAdd';
      w.write(str);
      await w.flush();
      print(str);
    } else {
      print('No .zshrc found');
      exit(1);
    }
  }
}
