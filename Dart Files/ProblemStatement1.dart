import 'dart:ffi';
import 'dart:io';

import 'Collections.dart';

/**
 * 
 * Suppose we have string array which contains ['a'...10]
 * C and D must be already True/ checked
 * All elements except we can toggle
 */

void toggle(Map<String, bool> allElementsArray) {
  print("Current State : ${allElementsArray}");

  allElementsArray.forEach((key, value) {
    print("Toggle $key? Current value is $value. || Type Y or N");
    var answer = stdin.readLineSync();
    if (answer == 'Y') {
      // Toggle the boolean value
      allElementsArray[key] = !value;
    }
  });
}

void solveProblem(List arr) {
  Map<String, bool> AllElementsArray = {};
  // Instead of for loop use map()
  for (var element in arr) {
    AllElementsArray[element] = false;
  }

  print("Elements in List : ${AllElementsArray}");

  print("Enter Characters you want to make PreChecked");
  var char1 = stdin.readLineSync();
  var char2 = stdin.readLineSync();

  char1 = char1?.toUpperCase();
  char2 = char2?.toUpperCase();

  Set preChecked = {};
  preChecked.add(char1);
  preChecked.add(char2);

  for (var element in preChecked) {
    AllElementsArray[element] = true;
  }

  print("Current State : ${AllElementsArray}");

  toggle(AllElementsArray);

  print("Do You Want to keep Playing. Type 'Play' || 'Exit'");
  var condition = stdin.readLineSync();

  while (condition == "Play") {
    toggle(AllElementsArray);
    print("Current State : ${AllElementsArray}");
  }
}

void main() {
  List arr = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'];
  solveProblem(arr);
}
