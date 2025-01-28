void main() {
  /**
   * Basically Spread Operator Inserts Multiple Values and 
   * Appends it into the list we want  
   */

  var list1 = [10, 20, 30];
  var set = list1.toSet();
  
  var list2 = [1, ...list1];
  print(list2); // Output : [1,10,20,30]

  //If the expression to the right of the spread operator might be null, you can
  //avoid exceptions by using a null-aware spread operator (...?)

  var nullList = [null];
  var list3 = [0, ...?nullList];
  print(list3);
}
