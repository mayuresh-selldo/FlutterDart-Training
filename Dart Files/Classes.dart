class Student {
  String? name;
  int? age;

  // Getter for name
  String? get stud_name {
    return name;
  }

  // Setter for name
  set stud_name(String? name) {
    this.name = name;
  }

  // Getter for age
  int? get stud_age {
    return age;
  }

  // Setter for age with a condition to check age
  set stud_age(int? age) {
    try {
      if (age! <= 18) {
        String error() => ' your age is less than 18 :(';
        throw error();
      } else {
        this.age = age;
      }
    } catch (e) {
      print(e);
    }
  }
}

class Parent {
  String? name;
  int? age;
  Parent(this.name, this.age);
  void printParentInfo() {
    print("Parent Name is ${name} and Age is ${age}");
  }
}

class Child extends Parent {
  String? childName;
  int? childAge;
  final DateTime start;

  Child(String? parentName, int? parentAge, this.childName, this.childAge)
      : start = DateTime.now(),
        super(parentName, parentAge);

  void printChildInfo() {
    print("Child Name is ${childName} and Age is ${childAge}");
    super.printParentInfo();
    print("This class is created at $start");
  }

  // Method overloading not allowed
  // int? printChildInfo(int? age) {
  //   print("Hello Overloading");
  //   return age;
  // }

  // Method Overriding Allowed
  void printParentInfo() {
    super.name = "Harsh";
    super.age = 10;
    print("This is Child Redeclaration");

    super.printParentInfo();
  }
}

void main() {
  var student = Student();
  student.stud_name = "Mayuresh";
  student.stud_age = 4;
  print("Student Name: ${student.stud_name}");
  print("Student Age: ${student.stud_age}");

  var ch = Child("Nitin", 45, "Mayuresh", 21);
  ch.printChildInfo();
  ch.printParentInfo();
}
