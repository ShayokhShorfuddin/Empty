import 'reader.dart';
import 'processor.dart';
import 'package:chalkdart/chalk.dart';

void main(List<String> args) {
  // No file is given.
  if (args.isEmpty || !args[0].endsWith('.emt')) {
    print(chalk.red("A .emt must be provided"));
    return;
  }

  // File is given
  // Reading source code!
  List<String> codeLines = read(args[0]);

  // Iterating over each line
  for (String line in codeLines) {
    print(process(line));
  }
}
