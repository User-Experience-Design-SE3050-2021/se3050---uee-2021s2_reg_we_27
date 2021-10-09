class Validator {
  static String? validateField({required String value}) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty. Please enter some value';
    }
    return null;
  }
}
