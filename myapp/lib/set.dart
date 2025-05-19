void main() {
  Set<dynamic> num = {1, 2, 34, 44};

  print(num);
  num.add(100);
  print(num);
  num.addAll({1000, 2000, 3000});
  print(num);
  num.remove(2000);
  print(num);
  print(num.contains(5000));
  print(num.first);
  print(num.last);
  print(num.elementAt(4));
}
