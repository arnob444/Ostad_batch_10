abstract class Vehicle {
  int? _speed;

  void move();
  void setSpeed(int speed) {
    _speed = speed;
  }
}

class Car extends Vehicle {
  @override
  void move() {
    print("The car is moving at $_speed km/h.");
  }
}

void main() {
  Car obj = Car();
  obj.setSpeed(100);
  obj.move();
}
