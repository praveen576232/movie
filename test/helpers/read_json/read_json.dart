import 'dart:io';

String readJson(String fileName) {
  final Directory directory = Directory.current;
  return File("${directory.path}/test/$fileName").readAsStringSync();
}
