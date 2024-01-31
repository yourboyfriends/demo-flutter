class MyObject {
  int value;
  MyObject({
    required this.value,
  });

  int get getvalue => value;
  set setvalue(newValue) => value = newValue;

  void increment() {
    value++;
  }

  void decrement() {
    value--;
  }

  void square() {
    value = value * value;
  }

  int power(int exponent) {
    int result = 1;

    for (int i = 0; i < exponent; i++) {
      result *= value;
    }

    return result;
  }
}
