void list() {
  print("");
  print("List Operations");
  List<int> arr = [1, 2, 3, 4];
  // arr.add("XYZ"); // this will give an error

  print(arr);

  arr.insert(0, 10); // {index : element} pair

  print(arr);

  arr.remove(10); // {value}

  print(arr);

  arr.clear();
  print(arr);

  // And Many More {To Explore}

  var list = [1, 2, 3];
  assert(list.length == 3);
  assert(list[1] == 2);

  list[1] = 1;
  assert(list[1] == 1);

  // Create a Compile time constant list
  var constantList = const [1, 2, 3];
  print(constantList);

  // constantList[0] = 10; // This Will give error (Unsupported operation: Cannot modify an unmodifiable list)
}

void set() {
  // Set in Dart is Unordered as it does not follow indexing
  // print(setprac[0]); // This is Throw Compile time error
  print("");
  print("Set Operations");

  Set<int> setprac = {1, 2, 3};
  print(setprac);
  print(setprac.elementAt(2));


  // add and addAll
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  Set<String> element = {}; // This creates an empty set
  element.add("Bromine"); // Adds One Element to the Set
  print(element);
  element.addAll(halogens); // Add the whole list of halogens into element set
  print(element);


  // Contains in Set or Not
  if (element.contains('Fluorine')) {
    print("Present in the Set");
  } else {
    print("Not Present");
  }
}

void map() {
  print("");
  print("Map Operations");
  Map<String, dynamic> arr = {'1': 5, '2': 10, '3': 15};

  print(arr['2']);

  arr['2'] = 30;

  print(arr['2']);
}

void hashMap() {
  // HashMap<String, int> str = {"1": 1}; // Check How to Initialize the values in HashMap
}

void main() {
  list();
  set();
  map();
}
