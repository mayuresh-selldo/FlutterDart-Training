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
      if (age! <= 5) {
        throw ArgumentError("Age should be greater than 5");
      } else {
        this.age = age;
      }
    } catch (e) {
      print(e);
    }
  }
}

void main() {
  var student = Student();

  student.stud_name = "Mayuresh";
  student.stud_age = 4;

  print("Student Name: ${student.stud_name}");
  print("Student Age: ${student.stud_age}");
}
