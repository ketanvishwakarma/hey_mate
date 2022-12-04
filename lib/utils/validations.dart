class Validations {
  static String? validate(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Please enter some text';
    } else {
      return RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value!)
          ? null
          : "It's should be alphanumeric";
    }
  }
}
