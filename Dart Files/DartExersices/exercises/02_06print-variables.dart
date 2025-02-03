import 'dart:ffi';
import 'dart:io';

void read(String? firstName, String lastName, int age, double height) {
  firstName = stdin.readLineSync()!;
  lastName = stdin.readLineSync()!;

  age = int.parse(stdin.readLineSync()!);
  height = double.parse(stdin.readLineSync()!);

  printAll(firstName, lastName, age, height);
}

void printAll(String firstName, String lastName, int age, double height) {
  print(firstName);
  print(lastName);
  print(age);
  print(height);
}

void main() {
  String? firstName, lastName = '';
  int age = 0;
  double height = 0;
  read(firstName, lastName, age, height);
}
