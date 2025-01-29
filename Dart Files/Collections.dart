import 'dart:collection';

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
  /**
   * In general, a map is an object that associates keys and values. 
   * Both keys and values can be any type of object. Each key occurs only once, 
   * but you can use the same value multiple times.
   */
  print("");
  print("Map Operations");

  // This is one way to create map
  Map<String, dynamic> arr = {'1': 5, '2': 10, '3': 15};

  // Or you can create by just assigning the Object in Key Value Pair like below
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };

  // How to Access
  print(gifts["first"]); // Access by specifying the key

  gifts.update('first', (value) => "Mayuresh");
  print("Updated Value : ${gifts["first"]}");
}

void hashMap() {
  /**
   * In Dart, a HashMap is a collection of key-value pairs,
   * similar to a regular Map, but with a specific internal implementation 
   * that uses a hash table to provide efficient access and retrieval. A HashMap 
   * in Dart is part of the dart:collection library and is often used when you 
   * need fast lookups, inserts, and deletions based on a hash-based key.
   */
  print("");
  print("HashMap Operations");
  var gifts = HashMap<dynamic, String>();

  // Adding key-value pairs
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';
  gifts['null'] = "null";
  gifts['null'] = "null";
  print(gifts.length);

  var str = "1234a";

  // var x = int.parse(str);
  print(1 is int);
  // print(x);

  // Accessing values by key
  print(gifts['first']); // Output: partridge

  // Checking if a key exists
  print(gifts.containsKey('second')); // Output: true
  print(gifts.containsKey('fourth')); // Output: false

  // Updating a value
  gifts['first'] = 'Mayuresh';
  print(gifts['first']); // Output: Mayuresh

  // Removing a key-value pair
  gifts.remove('second');
  print(gifts); // Output: {first: Mayuresh, fifth: golden rings}

  // Iterating over the HashMap
  gifts.forEach((key, value) {
    print('$key: $value');
  });

  var sets = HashSet<dynamic>();
  sets.add(Null);
  sets.add("Null");

  print(sets);
}

void Queues() {
  Queue<String>? pq = new Queue<String>();

  pq.addFirst("First Value in Queue");
  pq.addFirst("Second Value in Queue");
  pq.addLast("Third Value in Queue");
  pq.addLast("Fourth Value in Queue");

  print(pq);
}

void main() {
  list();
  set();
  map();
  hashMap();
  Queues();
}
