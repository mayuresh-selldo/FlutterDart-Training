// ## Exercise: Lowercase and Uppercase

// Using only one variable defined like this:

// ```dart
// String title = 'Dart course';
// ```

// Write a program that uses `title` to produce the following output:

// ```
// Dart course
// DART COURSE
// dart course
// ```

void main() {
  String title = 'Dart course';

  print(title);
  print(title.toUpperCase());
  print(title.toLowerCase());

  title = title
      .split(' ')
      .map((word) => word[0].toUpperCase() + word.substring(1))
      .join(' ');
  print(title);
}
