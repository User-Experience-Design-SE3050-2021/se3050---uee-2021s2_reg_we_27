class Validator {
  static String? validateField({required String value}) {
    if (value.isEmpty) {
      return 'Textfield cannot be empty';
    }
    return null;
  }
}