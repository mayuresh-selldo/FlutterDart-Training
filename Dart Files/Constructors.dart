class Selldo {
  int a = 0;
  int b = 10;

  Selldo(this.a);
  Selldo.newC(this.b);

  @override
  String toString() {
    return "1000";
  }

  int get add => a + b;

  set minus(var x) => a - b + x;
}

void main() {
  print(Selldo(100));

  print(Selldo(10112).add);
}
