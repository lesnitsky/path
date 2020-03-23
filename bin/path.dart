import 'package:l_cli/cli.dart';
import 'package:l_path/l_path.dart';

void main(List<String> args) async {
  final cli = new Cli();
  cli.add(PathCommand()..name = 'main');

  cli.exec(args);
}
