import 'dart:math';

abstract class EmployeeCredentialsGenerator {
  static String generateUserName({
    required String firstName,
    required String lastName,
    required String jobTitle,
    required DateTime dateOfBirth,
  }) {
    String firstNameRepresentation = aRToENChar[firstName[0]] ?? 'K';
    String lastNameRepresentation = aRToENChar[lastName[0]] ?? 'N';
    String jobTitleRepresentation = aRToENChar[jobTitle[0]] ?? 'E';
    String dateOfBirthRepresentation = dateOfBirth.year.toString();
    return '${firstNameRepresentation.toUpperCase()}${lastNameRepresentation.toUpperCase()}${jobTitleRepresentation.toUpperCase()}$dateOfBirthRepresentation';
  }

  static String generatePassword({
    required String firstName,
    required String lastName,
  }) {
    String firstNameRepresentation = aRToENChar[firstName[0]] ?? 'K';
    String lastNameRepresentation = aRToENChar[lastName[0]] ?? 'N';
    return '${firstNameRepresentation.toUpperCase()}${lastNameRepresentation.toUpperCase()}${generateRandomCredentials(length: 4)}';
  }

  static String generateRandomCredentials({int length = 5}) {
    return String.fromCharCodes(
        List.generate(length, (index) => (pickARandomCharCode())));
  }

  static int pickARandomCharCode() {
    List<int> codes = [];
    codes.add(Random().nextInt(10));
    codes.add(Random().nextInt(27) + 65);
    codes.add(Random().nextInt(27) + 97);
    return codes[Random().nextInt(3)];
  }
}

Map<String, String> aRToENChar = {
  'ا': 'a',
  'أ': 'a',
  'إ': 'e',
  'ب': 'b',
  'ت': 't',
  'ث': 'th',
  'ج': 'j',
  'ح': 'h',
  'خ': 'kh',
  'د': 'd',
  'ذ': 'th',
  'ر': 'r',
  'ز': 'z',
  'س': 's',
  'ش': 'sh',
  'ص': 's',
  'ض': 'dh',
  'ط': 't',
  'ظ': 'z',
  'ع': 'a',
  'غ': 'gh',
  'ف': 'f',
  'ق': 'k',
  'ك': 'k',
  'ل': 'l',
  'م': 'm',
  'ن': 'n',
  'ه': 'h',
  'و': 'w',
  'ي': 'y',
  'ى': 'a',
  'ئ': 'e',
};
