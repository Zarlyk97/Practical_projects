class Employee {
  final String name;
  final String department;

  Employee(this.name, this.department);
//////////////////////////////////
  String describeRole() {
    return 'Employee $name works in $department.';
  }
}
