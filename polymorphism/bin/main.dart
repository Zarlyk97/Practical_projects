import 'developer.dart';
import 'intern.dart';
import 'manager.dart';

void main() {
  var manager = Manager('Zarlyk Zhanybekov', 'IT', 10);
  var developer = Developer('Tolgonai Mamytova', 'Engineering', 'Dart');
  var intern = Intern('Cholponai Maksutova', 'HR', 'Aruke');

  final employees = [manager, developer, intern];

  displayRoles(employees);
}
