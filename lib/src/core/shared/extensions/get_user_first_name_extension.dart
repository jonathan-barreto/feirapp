extension GetUserFirstNameExtension on String {
  String getFirstName() {
    return split(' ').first;
  }
}
