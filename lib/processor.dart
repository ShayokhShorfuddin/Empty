import 'dart:io';
import 'package:chalkdart/chalk.dart';

String alphabets = 'abcdefghijklmnopqrstuvwxyz';
List keywords = ['empty', 'empt', 'mpty', 'emt', 'mpt', 'mty', 'mt'];
List upcasedKeywords = ['^empty', '^empt', '^mpty', '^mpt', '^mty', '^mt'];

String determiner(int index, {required bool upcased}) {
  index--;

  if (index > 26) {
    index = 0;
  }

  return upcased ? alphabets[index].toUpperCase() : alphabets[index];
}

List<String> subpartsExtractor(String part) {
  if (part.startsWith('^')) {
    part = part.substring(1);
  }

  int position = 0;
  String keyword = '';
  String char = part[position];
  List<String> finalList = [];

  void nextChar() {
    position += 1;

    if (position >= part.length) {
      char = 'EOF';
    } else {
      char = part[position];
    }
  }

  String peek() {
    if (position + 1 >= part.length) {
      return 'EOF';
    }

    return part[position + 1];
  }

  while (true) {
    // Unexpected Char
    if (!char.contains(RegExp('^[a-zA-Z]+')) && char != ' ') {
      quit(char);
    }

    // Alphabet
    if (char.contains(RegExp('^[a-zA-Z]+'))) {
      keyword += char;
    }

    // Space
    if (char == ' ') {
      if (!keywords.contains(keyword)) {
        quit(keyword);
      }

      finalList.add(keyword);
      keyword = '';

      while (peek() == ' ') {
        nextChar();
      }
    }

    // EOF
    if (peek() == 'EOF') {
      if (!keywords.contains(keyword)) {
        quit(keyword);
      }

      finalList.add(keyword);
      break;
    }

    nextChar();
  }

  return finalList;
}

void quit(String object) {
  print(chalk.red("Invalid - '$object'"));
  exit(0);
}

String process(String codeLine) {
  String output = '';

  for (String part in codeLine.split('.')) {
    // .. [Nothing]
    if (part == '') {
      output += ' ';
      continue;
    }

    // . . [Single Space]
    if (part == ' ') {
      output += 'a';
      continue;
    }

    // .^ . [Upcased Single Space]
    if (part == '^ ') {
      output += 'A';
      continue;
    }

    part = part.toLowerCase().trim();

    // . keyword . [Keyword]
    if (keywords.contains(part)) {
      output += determiner(part.length, upcased: false);
      continue;
    }

    // . ^keyword . [Upcased Keyword]
    if (upcasedKeywords.contains(part)) {
      output += determiner(part.length - 1, upcased: true);
      continue;
    }

    // . ^ keyword keyword . [Upcased or Non-Upcased Multiple Keywords]
    if (part.contains(' ')) {
      int index = 0;

      subpartsExtractor(part).forEach((element) {
        index += element.length;
      });

      output += determiner(index, upcased: part.startsWith('^'));
      continue;
    }

    // Invalid
    quit(part.trim());
  }

  return output;
}
