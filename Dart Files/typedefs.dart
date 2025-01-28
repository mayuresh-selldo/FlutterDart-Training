/**
 * typedef—is a concise way to refer to a type. 
 * Here's an example of declaring and using a type 
 * alias named intList:
 */

typedef intList = List<int>;
  typedef ListMapper<X> = Map<X, List<X>>;


void typeDef() {
  intList list = [1, 2, 3, 4,];

  print(list);

  Map<String, List<String>> m1 = {}; // Verbose.
  ListMapper<String> m2 = {}; // Same thing but shorter and clearer.
}

void main() {
  typeDef();
}
