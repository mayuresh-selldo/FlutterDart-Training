void errorHandling() {
  int time = 4;

  try {
    if (time > 5) {
      print("We have Time");
    } else {
      throw Exception("We Don't Have time"); // Throwing an error explicitly
    }
  } catch (e) {
    print(e); // This will print "We Don't Have time"
  }
}

void main() {
  errorHandling();
}
