// Dart does not support multiple inheritance directly using the extends keyword
// ignore_for_file: avoid_print

class Flyer {
  void fly() {
    print("Flying");
  }
}

class Swimmer {
  void swim() {
    print("Swimming");
  }
}

class Duck implements Flyer, Swimmer {
  @override
  void fly() {
    print("Duck is flying");
  }

  @override
  void swim() {
    print("Duck is swimming");
  }
}

void main() {
  Duck duck = Duck();
  duck.fly();
  duck.swim();
}
