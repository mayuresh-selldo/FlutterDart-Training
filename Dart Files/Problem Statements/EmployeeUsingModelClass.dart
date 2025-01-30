import 'dart:io';

class EmployeeModelClass {
  String name;
  int age;
  String department;
  Map<int, int> phoneNumbers;
  Map<int, String> emailAddresses;
  Map<String, Address> Addresses;

  EmployeeModelClass({
    required this.name,
    required this.age,
    required this.department,
    required this.phoneNumbers,
    required this.emailAddresses,
    required this.Addresses,
  });
}

class Address {
  String city;
  String lane1;
  String state;
  int pincode;
  String country;

  Address({
    required this.city,
    required this.lane1,
    required this.state,
    required this.pincode,
    required this.country,
  });
}

class EmployeeOperations {
  List<EmployeeModelClass> employee = [];

  void addEmployee() {
    employee.addAll([
      EmployeeModelClass(
          name: "Mayuresh",
          age: 21,
          department: "Product Engineering",
          phoneNumbers: {
            1: 9100001111,
            2: 9230002929,
            3: 0293290832,
          },
          emailAddresses: {
            1: "mayuresh@gmail.com",
            2: "mayuresh@outlook.com",
            3: "mayuresh@yahoo.com",
          },
          Addresses: {
            "Resedential Address": Address(
                city: "Pune",
                lane1: "Katraj",
                state: "Maharashtra",
                pincode: 411046,
                country: "India"),
            "Permanent Address": Address(
                city: "Sangli",
                lane1: "Near SFC Mega Mall",
                state: "Maharashtra",
                pincode: 416416,
                country: "India")
          }),
      EmployeeModelClass(
          name: "Mayur",
          age: 21,
          department: "Sales",
          phoneNumbers: {
            1: 9100001111,
            2: 9230002929,
            3: 0293290832,
          },
          emailAddresses: {
            1: "mayuresh@gmail.com",
            2: "mayuresh@outlook.com",
            3: "mayuresh@yahoo.com",
          },
          Addresses: {
            "Resedential Address": Address(
                city: "Pune",
                lane1: "Katraj",
                state: "Maharashtra",
                pincode: 411046,
                country: "India"),
            "Permanent Address": Address(
                city: "Sangli",
                lane1: "Near SFC Mega Mall",
                state: "Maharashtra",
                pincode: 416416,
                country: "India")
          })
    ]);
  }

  void showEmployee(List<EmployeeModelClass> employeeList, String name) {
    var matchingEmployees = employeeList
        .where((e) => e.name.toLowerCase().contains(name.toLowerCase()))
        .toList();

    if (matchingEmployees.isNotEmpty) {
      for (var emp in matchingEmployees) {
        print("Name: ${emp.name}");
        print("Age: ${emp.age}");
        print("Department: ${emp.department}");

        print("Phone Numbers:");
        emp.phoneNumbers.forEach((key, value) {
          print("$key: $value");
        });

        print("Email Addresses:");
        emp.emailAddresses.forEach((key, value) {
          print("$key: $value");
        });

        print("Addresses:");
        emp.Addresses.forEach((key, address) {
          print(
              "$key: ${address.city}, ${address.lane1}, ${address.state} - ${address.pincode}, ${address.country}");
        });
        print("");
      }
    } else {
      print("No employee found with the given name.");
    }
  }
}

void main() {
  var operations = EmployeeOperations();
  operations.addEmployee();

  print("Enter Name You Want to Find : ");
  String? name = stdin.readLineSync();

  operations.showEmployee(operations.employee, name!);
  // operations.showEmployee(operations.employee, "yuresh");
  // operations.showEmployee(operations.employee, "Harsh");
}
