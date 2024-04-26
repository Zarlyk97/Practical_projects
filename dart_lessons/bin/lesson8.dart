import 'dart:io';

void main() {
  print('Как вас зовут?');
  print('Ваше имя: ');
  var a = stdin.readLineSync();
  String b = 'Добро пожаловать';
  stdout.write('$b, $a');
}
