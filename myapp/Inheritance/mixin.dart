// Mixin 1
// ignore_for_file: avoid_print

mixin Flyable {
  void fly() {
    print("I can fly!");
  }
}

// Mixin 2
mixin Swimmable {
  void swim() {
    print("I can swim!");
  }
}

// Base class
class Animal {
  void eat() {
    print("Eating");
  }
}

// Class using mixins
class Duck extends Animal with Flyable, Swimmable {
  void quack() {
    print("Quack!");
  }
}

void main() {
  Duck duck = Duck();
  duck.eat();   // From Animal
  duck.fly();   // From Flyable mixin
  duck.swim();  // From Swimmable mixin
  duck.quack(); // From Duck
}