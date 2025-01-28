// ## Exercise: Temperature conversion

// Given the following:

// ```dart
// double tempFarenheit = 86;
// ```

// Write a program to convert the temperature to Celsius, using this formula:

// ```
// Fahrenheit to Celsius:   (°F − 32) / 1.8 = °C
// ```

// Then, print the result. The output of this program should be:

// ```
// 86F = 30C
// ```

// Bonus: the converted temperature in celsius should show at most 1 fractional digit.

import '../lessons/mixins_extensions/number_parsing.dart';

void main() {
  double tempFarenheit = 86.34;
  double Celsius = (tempFarenheit - 32) / 1.8;
  print("${tempFarenheit.toStringAsFixed(1).toIntOrNull()}F = ${Celsius.toStringAsFixed(2)}C");
}
