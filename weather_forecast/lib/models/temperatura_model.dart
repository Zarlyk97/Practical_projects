String temperatura(int number) {
  return switch (number) {
    (1) => '7 °F',
    (2) => '9 °F',
    (3) => '22 °F',
    (4) => '16 °F',
    (5) => '20 °F',
    (6) => '23 °F',
    (7) => '8 °F',
    _ => '$number турист',
  };
}
