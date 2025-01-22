void checkNullability() {
  /**
   * The Dart language enforces sound null safety.
   * Null safety prevents an error that results from unintentional access of 
   * variables set to null. The error is called a null dereference error. 
   * A null dereference error occurs when you access a property or call a 
   * method on an expression that evaluates to null.
   * 
   * Note : 
   *  To enable nullability, you add a ? to the end of the type declaration.
   */
  String string1 =
      "Hello This String Cant be null, Try If You Want by un commenting the line below";
  // string1 = null;
  print(string1);

  String? string2;
  // string2 = null; // Check whether this works or not
  print(string2);
}

void checkDynamicKeyword() {
  /*
  dynamic - 
    dynamic is similar to var it is used for the values that can be dynamically
    changed

  Note : 
    In dynamic we can change the data type of the value but not in var
    if var name = "String" we can change the value but not the type

  */
  dynamic age = 10;
  print(age + 30);
  age = "20";
  print(age + "30");
}

void primitiveDataTypes() {
  /**
   * Primitive Data Types : 
      Numbers (int, double)
      Strings (String)
      Booleans (bool)
      Records ((value1, value2))
      Functions (Function)
      Lists (List, also known as arrays)
      Sets (Set)
      Maps (Map)
      Runes (Runes; often replaced by the characters API)
      Symbols (Symbol)
      The value null (Null)
  */
}

void varKeyword() {
  /*var - 
    var keyword implicitely typecasts the value given to it
    also it provides the methods available to that type of data.
    for example 'name' here is of String class and 'length' is of 
    int class (Primitive Data Type) so it provides different Methods to 
    the given variables based on the data type of the value we have given.

  # Note : 
    primitive data type methods dont need () round brackets ex: isEven
    whereas Wrapper Class methods need () ex : toLowerCase()
  */
  var name = "Mayuresh";
  name = "Harsh";
  // name = 10; Gives Type Conversion Error
  var length = 10;
  String name1 = "xyz";

  print(name.toLowerCase());
  print(length.isEven);
}

void defaultValue() {
  /**
   * Uninitialized variables that have a nullable type have an 
   * initial value of null. Even variables with numeric types 
   * are initially null, because numbers—like everything else 
   * in Dart—are objects.
   */

  int? lineCount;
  assert(lineCount == 1);
  assert(lineCount == null);
}

void lateVariable() {
  late String description; // Didnt Understand late keyword

  void giveDesc() {
    description = 'Feijoada!';
    print(description);
  }

  String readTemp() {
    return "10 Degrees";
  }

  giveDesc();
  late String Temperature = readTemp();
  print(Temperature);
}

void finalAndconstVariable() {
  /**
   * If you never intend to change a variable, use final or const, 
   * either instead of var or in addition to a type. A final variable 
   * can be set only once; a const variable is a compile-time 
   * constant. (Const variables are implicitly final.)
   */

  // final variable can be runtime constant.
  // for example you get some value from API and you set it to the variable 
  //then its done its basically one time runtime or compile time assignment of value

  final name = 'Bob'; // Without a type annotation
  final String nickname = 'Bobby';
  // nickname = "Mayuresh"; // This will Give error

  // const is simply compile time constant we have to explicitely set value of 
  // the variable defined with constant. The const keyword isn't just for declaring 
  // constant variables. You can also use it to create constant values, as well 
  // as to declare constructors that create constant values. Any variable can have 
  // a constant value.

}

void main() {
  // Following are the Examples of the Variables that can be used in Dart/Flutter

  varKeyword();
  checkDynamicKeyword();
  checkNullability();
  defaultValue();
  lateVariable();
}
