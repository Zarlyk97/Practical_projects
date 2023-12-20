import 'employee.dart';

class Developer extends Employee {
  String programmingLanguage;

  Developer(String name, String department, this.programmingLanguage)
      : super(name, department);

  @override
  String describeRole() {
    return 'Developer: $name works with $programmingLanguage in $department.';
  }
}
