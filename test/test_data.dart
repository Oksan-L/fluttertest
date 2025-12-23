import 'dart:math';

class TestData {
  // right credentials
  static const String validEmail = 'test@example.com';
  static const String validPassword = 'password123';

  // wrong password generator
  static String generateInvalidPassword() {
    const chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random rnd = Random();

    // generate random 10-character string
    String result = String.fromCharCodes(Iterable.generate(
        10, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));

    // ensure it's different from the valid password
    if (result == validPassword) {
      return '${result}_wrong';
    }
    
    return result;
  }
}