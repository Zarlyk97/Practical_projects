import 'dart:io';

class Screen {
  // Бул getInput методу, бул сандарды жана опеарация белгисин клавиатурадан окуп List түрүндө кайтарат.
  getInput() {
    double a = double.parse(stdin.readLineSync()!);
    String op = stdin.readLineSync()!;
    double b = double.parse(stdin.readLineSync()!);
    return [a, op, b];
  }
}

class Math {
  add(a, b) => a + b;

  subtract(a, b) {
    var joop = a - b;
    print(joop);
  }

  multiply(a, b) {
    var result1 = a * b;
    print(result1);
  }

  divide(a, b) {
    var result = a / b;
    print(result);
  }
}

// Calculator бул негизги класс Screen жана Math объектерин түзөт
class Calculator {
  late Screen screen;
  late Math math;

  Calculator() {
    screen = Screen();
    math = Math();
  }

//operate() методу калкуляцияны жүргүзүү үчүн колдонулат
// Ал screen ден сандарды жана операцияны окуп алат
// Операцияга жараша Math классынын  тиешелүү методун чакырат  (мисалы:кошуу болсо add(), эгер бөлүү болсо Divide()ушул сыяктуу).
// Эсептөөнүн жообун басат
// бул 3 класс өз ара аракеттенип калькуляторду түзүшөт.
  operate() {
    List input = screen.getInput();
    double a = input[0];
    String op = input[1];
    double b = input[2];

    if (op == '+') {
      print('баштадык');
      print(math.add(a, b));
      print('баштадык');
    } else if (op == '-') {
      print(math.subtract(a, b));
    } else if (op == '*') {
      print(math.multiply(a, b));
    } else if (op == '/') {
      print(math.divide(a, b));
    }
  }
}

void main() {
  Calculator calc = Calculator();
  calc.operate();
  print(calc);
}
