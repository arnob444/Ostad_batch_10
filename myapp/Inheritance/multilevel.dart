// ignore_for_file: avoid_print

class Animal {
  void eat() {
    print("Animal is eating");
  }
}

class Dog extends Animal {
  void bark() {
    print("Dog is barking");
  }
}

class Cat extends Dog {
  void meow() {
    print("Cat is meowing");
  }
}

void main() {
  Cat cat = Cat();

  cat.eat(); 
  cat.meow(); 
  cat.bark();
}
