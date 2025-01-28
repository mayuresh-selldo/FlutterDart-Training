import 'dart:collection';

void forLoop() {
  var message = StringBuffer('Dart is fun');
  for (var i = 0; i < 5; i++) {
    message.write('!');
  }

  print(message);
}

void closures() {
  var callbacks = [];
  for (var i = 0; i < 2; i++) {
    callbacks.add(() => print(i));
  }

  for (final c in callbacks) {
    c();
  }
}

void forIn() {
  var candidates = HashMap<String, int?>();
  var candidates1 = Map<String, int>();

  candidates["Mayuresh"] = null;
  candidates["Harsh"] = 20;
  candidates["Aryan"] = 30;

  candidates1["XYz"] = 40;
  candidates1["pqr"] = 50;
  candidates1["abc"] = 60;

  candidates.forEach((k, v) => print("Name is $k and Age is $v"));
  candidates1.forEach((k, v) => print("Name is $k and Age is $v"));
  
}

void main() {
  forLoop();
  closures();
  forIn();
}
