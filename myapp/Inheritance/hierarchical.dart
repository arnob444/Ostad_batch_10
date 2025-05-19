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

class Cat extends Animal {
  void meow() {
    print("Cat is meowing");
  }
}

void main() {
  Dog dog = Dog();
  Cat cat = Cat();

  dog.eat();
  dog.bark();

  cat.eat();
  cat.meow();
}
