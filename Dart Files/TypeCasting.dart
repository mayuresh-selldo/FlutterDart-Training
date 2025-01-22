// Run this Code in Debug Mode to Better Understand
void main() {
  // String -> int
  var one = int.parse('1');
  assert(one == 1); // This will Give and Assertion Error

  // String -> double
  var onePointOne = double.parse('1.1');
  assert(onePointOne == 1.1); // This will Give and Assertion Error

  // int -> String
  String oneAsString = 1.toString();
  assert(oneAsString == '1'); // This will run fine

  // double -> String
  String piAsString = 3.14159.toStringAsFixed(2);
  assert(piAsString == '3.14'); // This will run fine
}
