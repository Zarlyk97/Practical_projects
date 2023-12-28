void main() {
  print(calculate(5, 5));
}

String calculate(int a, int b) {
  if (a == b) return 'число ровны';
  return a > b ? 'больше' : 'меньше';
}
