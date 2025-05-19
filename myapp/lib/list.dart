// ignore_for_file: avoid_print

void main() {
  List<int> numbers = [1, 2, 3];
  List<String> fruits = ["mango", "apple", "banana"];

  print(numbers.length);
  print(numbers.isNotEmpty);
  print(numbers[0]);
  print(fruits.first);
  print(fruits.last);

  // list data add
  fruits.insert(1, "jackfruit");
  print(fruits);

  fruits.insertAll(2, ["coconut", "lichi"]);
  print(fruits);

  // final list [mango, jackfruit, coconut, lichi, apple, banana]

  // list data remove
  fruits.removeAt(2);
  print(fruits);

  fruits.remove("jackfruit");
  print(fruits);

  // after remove current list [mango, lichi, apple, banana]
  // update
  fruits[1] = "jackfruit";
  print(fruits);

  ///fixed length list

  List<int> fixedlist = List<int>.filled(3, 0);
  // fixedlist[0] = 1;
  // fixedlist[1] = 2;
  // fixedlist[2]=3;

  print(fixedlist);

  ///growable list

  List<int> growableList = [];
  growableList.add(4);
  growableList.add(5);
  print(growableList);
}
