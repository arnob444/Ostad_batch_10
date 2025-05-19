void main() {
  // var person = {
  //   'name': 'Arnob',
  //   'age': 23,
  //   'exp': '5 years',
  // };

  Map<String, String> person = {
    'name': 'Arnob',
    'age': '23',
    'exp': '5 years',
  };

  print(person);
  print(person['name']);
  person['address'] = 'Dhaka';
  print(person);

  // var others = {
  //   'subject': 'CSE',
  //   'cgpa': 3.80,
  // };
  Map<String, String> others = {
    'subject': 'CSE',
    'cgpa': '3.80',
  };

  person.addAll(others);
  print(person);
  print(person.containsKey('name'));
  print(person.containsValue(23));
  print(person.keys);
  print(person.values);
}
