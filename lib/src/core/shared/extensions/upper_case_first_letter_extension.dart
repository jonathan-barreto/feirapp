extension UpperCaseFirstLetterExtension on String {
  String upperCaseFirstLetter() {
    final List<String> nameList = split(
      '',
    );

    nameList.first = nameList.first.toUpperCase();
    final String name = nameList.join();

    return name;
  }
}
