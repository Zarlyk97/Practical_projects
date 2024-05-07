import 'dart:io';

void main() {
  print(downloadfile());
}

Future<String> downloadfile() async {
  return await File('file.txt').readAsString();
}
