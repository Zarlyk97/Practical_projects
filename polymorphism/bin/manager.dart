import 'employee.dart';

class Manager extends Employee {
  int teamSize;

  Manager(String name, String department, this.teamSize)
      : super(name, department);

  @override
  String describeRole() {
    return 'Manager: $name oversees a team of $teamSize in $department.';
  }
}
