/**
 * Generics are often required for type safety, but they have more benefits 
 * than just allowing your code to run:
 * Properly specifying generic types results in better generated code.
 * You can use generics to reduce code duplication.
 */

// Based on the type we want to use in our application we can set type
// For example I want to take the Contact Number. I would specify its type is int or num

abstract class ObjectCache {
  Object getByKey(String key);
  void setByKey(String key, Object value);
}

abstract class StringCache {
  String getByKey(String key);
  void setByKey(String key, String value);
}

abstract class Cache<T> {
  T getByKey(String key);
  void setByKey(String key, T value);
}

void generics() {
  var names = ["Mayuresh", "Aryan"];
  names.add("Harsh");
  // names.add(10); // This results in error Since the type is String

  print(names.runtimeType);

  var T = int;
  print(T
      .runtimeType); // If we have to check type or some variable we use runtimeType
}

void main() {
  generics();
}
