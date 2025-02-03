Future<void> AsyncAwaitFutures() async {
  Future<String> returnString() async {
    return Future.delayed(
        const Duration(seconds: 10), () => "Returning the Strings");
  }

  var response = await returnString();
  print(response);
  print("Hello World");
}

void main() {
  AsyncAwaitFutures();
}
