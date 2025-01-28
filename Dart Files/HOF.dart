void filterPractice() {
  const arr = [1, 2, 3, 4, 5, 6, 7, 8];

  bool isEven(int number) => (number % 2 == 0);
  bool isOdd(int number) => !isEven(number);

  var finalEvenElements = <int>[];

  // Filter
  finalEvenElements =
      arr.where((element) => element.isEven).toList(); // One Way of Doing it
  print(finalEvenElements);

  // Reduce
  var finalOddElements =
      arr.reduce((accumulator, element) => accumulator + element);

  var finalResult = print(finalOddElements);

  var flatMap = [1, 2, 3].expand((e) => [e, e + 1]);
  print(flatMap);

  // bool xyz = false;
  // switch (xyz) { // This Doesnt Works

  // }

  switch (100) {
    case 1:
      print("xyz");
    default:
      print("Default");
  }

  List arr2 = [239, 4, 5, 6, 6, 7, 43, 3];
  arr2.sort();
  print(arr2);

  List arr3 = [239, 4, 5, 6, 6, 7, 43, 3];
  arr3.sort((a, b) => b.compareTo(a)); // Sorting in descending order
  print(arr3);

  var array = [1, 2, 3, 4, 5, 6, 7, 8];
  var evenArray = array.where((element) => element % 2 == 0);
  print(evenArray);
}

void mapMethod() {
  var teas = ['green', 'black', 'chamomile', 'earl grey'];

  var loudTeas = teas.map((tea) => tea.toUpperCase());
  loudTeas.forEach(print);
}

void main() {
  filterPractice();
  mapMethod();
}
