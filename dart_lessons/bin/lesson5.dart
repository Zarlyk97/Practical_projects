void main() {
  for (var element in ClassName().name) {
    if (element == "Amir") {
      break;
    }
    print(element);
  }
}

class ClassName {
  List<String> name = ["Zarlyk", "Amir", "Jumagul, Amir, Zarlyk"];
}
