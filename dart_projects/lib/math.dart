class Math {
  double add(double a, double b) => a + b;
  double subtract(double a, double b) => a - b;
  double multiply(double a, double b) => a * b;
  double divide(double a, double b) {
    if (b != 0) {
      return a / b;
    } else {
      print("Error: Division by zero!");
      return double.nan;
    }
  }
}
