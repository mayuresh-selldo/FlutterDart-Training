/**
 * Dart offers collection if and collection for 
 * for use in list, map, and set literals. You can use these 
 * operators to build collections using conditionals (if) and repetition (for).
 */

void collectionIf() {
  bool permissions = true;
  // bool permissions = false; // Toggle and Understand yourself
  var navBar = ["Home", "About", "Contact", if (permissions) "Inventory"];
  print(navBar);
}

void collectionFor() {
  var listOfIntegers = [1, 2, 3, 4];
  var listOfStrings = ['#0', for (var i in listOfIntegers) '#$i'];
  print(listOfStrings);
}

void main() {
  collectionIf();
  collectionFor();
}
