// Dart program in Dart to illustrate
// getters and setters #GFG
void main() {
  var cat = new Cat();

// Is cat hungry? true
  print("Is cat hungry? ${cat.isHungry}");

// Is cat cuddly? false
  print("Is cat cuddly? ${cat.isCuddly}");

  print("Feed cat.");
  cat.isHungry = false;

// Is cat hungry? false
  print("Is cat hungry? ${cat.isHungry}");

// Is cat cuddly? true
  print("Is cat cuddly? ${cat.isCuddly}");
}

class Cat {
  bool _isHungry = true;

  bool get isCuddly => !_isHungry;

  bool get isHungry => _isHungry;
  void set isHungry(bool hungry) => this._isHungry = hungry;
}
