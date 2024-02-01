class Items {
  int _counter = 0;
  void incrementCounter() {
    if (_counter < 50) _counter++;
  }

  void decrementCounter() {
    if (_counter > 0) _counter--;
  }

  int getCounter() {
    return _counter + 0;
  }
}
