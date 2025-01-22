void list() {
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
}

void set() {
  Set<int> setprac = {1, 2, 3};
  print(setprac);

  print(setprac.elementAt(2));

  // To Explore Ordered or unordered sets??
  // To Explore Methods available
}

void map() {
  Map<String, dynamic> arr = {'1': 5, '2': 10, '3': 15};

  print(arr['2']);

  arr['2'] = 30;

  print(arr['2']);

  
}

void hashMap(){
  // HashMap<String, int> str = {"1": 1}; // Check How to Initialize the values in HashMap
}

void main(){
  list();
  set();
  map();  
}
