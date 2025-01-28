void main() {
  // Similar to Any other OOP Language moreover C++
  int boxLength = 10;
  print(boxLength);

  print("The Length Of the Box is : ${boxLength}");
  // This is String Interpolation and is done by using ${}
  for (int i = 0; i < 10; i++) {
    print("${boxLength * 2} ");
    boxLength++;
  }
}
