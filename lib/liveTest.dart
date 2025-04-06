void main() {

  List<Map<String, dynamic>> students = [
    {"name": "Alice", "scores": [85, 90, 78]},
    {"name": "Bob", "scores": [88, 76, 95]},
    {"name": "Charlie", "scores": [90, 92, 85]},
  ];

  Map<String, double> averages = {};
  for (var s in students) {
    String name = s["name"];
    List<int> scores = List<int>.from(s["scores"]);
    double avg = scores.reduce((a, b) => a + b) / scores.length;
    averages[name] = double.parse(avg.toStringAsFixed(2));
  }

  var finalAns = averages.entries.toList()
    ..sort((a, b) => b.value.compareTo(a.value));


  Map<String, double> sortedAverages = {
    for (var entry in finalAns) entry.key: entry.value
  };

  print(sortedAverages);
}
