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

  void manualAddEmployee() {
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

  void dynamicAddEmployee(List<EmployeeModelClass> employeeList) {
    Map<int, int> initialPhoneNumbers = {};
    Map<int, String> initialEmails = {};
    Map<String, Address> initialAddresses = {};

    EmployeeModelClass newEmployee = EmployeeModelClass(
        name: '',
        age: 0,
        department: '',
        phoneNumbers: initialPhoneNumbers,
        emailAddresses: initialEmails,
        Addresses: initialAddresses);

    // Adding Name of the Employee
    print("Enter the Name : ");
    String name = stdin.readLineSync()!;
    newEmployee.name = name;

    // Adding Age of the Employee
    print("Enter the Age of the Employee : ");
    int age = int.parse(stdin.readLineSync()!);
    newEmployee.age = age;

    // Adding Department of the Employee
    print("Enter the Department of the Employee: ");
    String dept = stdin.readLineSync()!;
    newEmployee.department = dept;

    // Adding Phone Numbers
    print("How Many Phone Numbers Do You Want to Add?");
    int noOfPhoneNumbers = int.parse(stdin.readLineSync()!);
    Map<int, int> phNo = {};

    for (int i = 0; i < noOfPhoneNumbers; i++) {
      print("Enter ${i + 1} Phone Number : ");
      int currPhone = int.parse(stdin.readLineSync()!);
      if (currPhone.toString().length < 10) {
        print("Enter Valid Phone Number");
        i--; // Retry for this index
      } else {
        phNo[i + 1] = currPhone;
      }
    }
    print("Your Phone Numbers are : $phNo");
    newEmployee.phoneNumbers = phNo;

    // Adding Emails
    print("How Many Emails Do You Want to Add?");
    int noOfEmails = int.parse(stdin.readLineSync()!);
    Map<int, String> emailList = {};

    for (int i = 0; i < noOfEmails; i++) {
      print("Enter ${i + 1} Email : ");
      String currMail = stdin.readLineSync()!;
      emailList[i + 1] = currMail;
    }
    print("Your Emails are : $emailList");
    newEmployee.emailAddresses = emailList;

    // Adding Addresses
    Map<String, Address> addresses = {};

    print("Do you want to add Residential Address? (yes/no)");
    String addResidential = stdin.readLineSync()!.toLowerCase();

    if (addResidential == "yes") {
      print("\nEnter Residential Address Details:");
      print("Enter City: ");
      String city = stdin.readLineSync()!;
      print("Enter Lane/Street: ");
      String lane = stdin.readLineSync()!;
      print("Enter State: ");
      String state = stdin.readLineSync()!;
      print("Enter Pincode: ");
      int pincode = int.parse(stdin.readLineSync()!);
      print("Enter Country: ");
      String country = stdin.readLineSync()!;

      addresses["Residential Address"] = Address(
          city: city,
          lane1: lane,
          state: state,
          pincode: pincode,
          country: country);
    }

    print("\nDo you want to add Permanent Address? (yes/no)");
    String addPermanent = stdin.readLineSync()!.toLowerCase();

    if (addPermanent == "yes") {
      print("\nEnter Permanent Address Details:");
      print("Enter City: ");
      String city = stdin.readLineSync()!;
      print("Enter Lane/Street: ");
      String lane = stdin.readLineSync()!;
      print("Enter State: ");
      String state = stdin.readLineSync()!;
      print("Enter Pincode: ");
      int pincode = int.parse(stdin.readLineSync()!);
      print("Enter Country: ");
      String country = stdin.readLineSync()!;

      addresses["Permanent Address"] = Address(
          city: city,
          lane1: lane,
          state: state,
          pincode: pincode,
          country: country);
    }

    if (addresses.isEmpty) {
      print("Warning: No addresses added for the employee.");
    } else {
      print("\nAdded Addresses:");
      addresses.forEach((type, address) {
        print(
            "$type: ${address.city}, ${address.lane1}, ${address.state} - ${address.pincode}, ${address.country}");
      });
    }

    newEmployee.Addresses = addresses;

    employeeList.add(newEmployee);
    print("\nEmployee added successfully!");
  }

  void updateEmployee(List<EmployeeModelClass> employeeList) {
    print("Enter the Name of the Employee you want to update : ");
    String name = stdin.readLineSync()!;

    var matchingEmployees = employeeList
        .where((e) => e.name.toLowerCase().contains(name.toLowerCase()))
        .toList();

    if (matchingEmployees.length > 1) {
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
      print("Out of These Employees type correct name");
      updateEmployee(employeeList);
    } else if (matchingEmployees.length == 1) {
      var emp = matchingEmployees[0];
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
      print("What Do you want to Update");
      String input = stdin.readLineSync()!;
      switch (input) {
        case "name":
          print("Enter Updated Name : ");
          String newName = stdin.readLineSync()!;

          emp.name = newName;
          print("Name Updated SuccessFully");

          break;

        case "age":
          print("Enter Updated Age : ");
          int newAge = int.parse(stdin.readLineSync()!);

          emp.age = newAge;
          print("Age Updated SuccessFully");

          break;

        case "department":
          print("Enter Updated Department : ");
          String newDept = stdin.readLineSync()!;

          emp.department = newDept;
          print("Department Updated SuccessFully");

          break;

        case "phoneNumbers":
          var phoneNumberList = emp.phoneNumbers;

          if (phoneNumberList.length > 1) {
            print(
                "Out of Below Phone Number Which Do you want to change. Enter Number: ");
            phoneNumberList.forEach((key, value) {
              print("$key : $value");
            });

            int key = int.parse(stdin.readLineSync()!);

            print("Enter Updated Number : ");
            int newPhoneNumber = int.parse(stdin.readLineSync()!);

            phoneNumberList[key] = newPhoneNumber;
            print("Phone Number Updated SuccessFully");
          } else if (phoneNumberList.length == 0) {
            Map<int, int> currPhoneNumber = phoneNumberList[0] as Map<int, int>;

            print("Enter Updated Phone Number : ");
            int newPhoneNumber = int.parse(stdin.readLineSync()!);

            currPhoneNumber[0] = newPhoneNumber;
            print("Phone Number Updated SuccessFully");
          } else {
            print("No Phone Number Found");
          }

          break;

        case "emailAddresses":
          break;

        case "Addresses":
          break;

        default:
          break;
      }
    } else {
      print("No employee found with the given name.");
    }
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

  void showEmployees(List<EmployeeModelClass> employeeList) {
    if (employeeList.isNotEmpty) {
      print("");
      print("---------------------Total Employee List---------------------");
      for (var emp in employeeList) {
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
        print(
            "------------------------------------------------------------------");
        print("");
      }
    } else {
      print("No Employees Found");
    }
  }
}

void main() {
  var operations = EmployeeOperations();
  operations.manualAddEmployee();

  print("""Which Operation Do You Want to Perform? 
      \n1.Create Employee (Type : 'create') 
      \n2.Show Employee (Type : 'show') 
      \n3.Show All Employees (Type : 'show all')  
      \n4.Update Employee (Type : 'update')""");

  String input = stdin.readLineSync()!;
  switch (input) {
    case "create":
      operations.dynamicAddEmployee(operations.employee);
      operations.showEmployees(operations.employee);
      break;

    case "show":
      print("Enter Name You Want to Find : ");
      String? name = stdin.readLineSync();
      operations.showEmployee(operations.employee, name!);
      break;

    case "show all":
      operations.showEmployees(operations.employee);
      break;

    case "update":
      operations.updateEmployee(operations.employee);
      operations.showEmployees(operations.employee);

    default:
      break;
  }

  // operations.showEmployee(operations.employee, "yuresh");
  // operations.showEmployee(operations.employee, "Harsh");
}
