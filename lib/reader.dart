// ignore_for_file: non_constant_identifier_names
import 'dart:io';
import 'package:chalkdart/chalk.dart';

List<String> read(filename) {
  File data = File(filename);

  // File doesn't exist
  if (!data.existsSync()) {
    print(chalk.red("$filename doesn't exist."));
    exit(0);
  }

  // File exists
  return data.readAsLinesSync();
}
