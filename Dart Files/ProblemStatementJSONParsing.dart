import 'dart:convert';
import 'dart:io';

void main() async {
  String filepath =
      '/home/mayuresh/Development Practice Flutter/Dart Files/demo.json';

  File file = File(filepath);
  String contents = await file.readAsString();

  var jsonData = jsonDecode(contents);
  List<double> finalArray = List.filled(6, 0.0);

  var Data = jsonData['data'];
  // print(Data);

  for (var dimensions1 in Data) {
    var dimension1 = dimensions1['dimensions'];
    for (var dimensions2 in dimension1) {
      var innerDimension = dimensions2['dimensions'];
      for (var inner in innerDimension) {
        var values = inner['values'];
        for (int i = 0; i < values.length; i++) {
          finalArray[i] += values[i].toDouble();
        }
      }
    }
  }

  print(finalArray);
}
