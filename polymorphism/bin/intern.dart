import 'employee.dart';

class Intern extends Employee {
  final String supervisor;

  Intern(String name, String department, this.supervisor)
      : super(name, department);

  @override
  String describeRole() {
    return 'Intern: $name is supervised by $supervisor in $department.';
  }
}

void displayRoles(List<Employee> employees) {
  for (var employee in employees) {
    print(employee.describeRole());
  }
}
