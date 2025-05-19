// ignore_for_file: avoid_print

void main() {
  List<Map<String, dynamic>> list = [
    {'name': 'Arnob', 'age': 26},
    {'name': 'Anik', 'age': 21},
    {'name': 'Apurbo', 'age': 22},
  ];

  for (var a in list) {
    print(a['name']);
  }
}
