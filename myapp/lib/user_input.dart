import 'dart:io';
void main() {
  String? name = stdin.readLineSync();
  int? age = int.tryParse(stdin.readLineSync()!);

  print(name);
  print(age);
}