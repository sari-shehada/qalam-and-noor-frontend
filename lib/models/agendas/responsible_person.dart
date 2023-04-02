// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ResponsiblePerson {
  int id;
  String firstName;
  String lastName;
  String relationToStudent;
  String phoneNumber;
  DateTime dateOfBirth;
  String placeOfBirth;
  ResponsiblePerson({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.relationToStudent,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.placeOfBirth,
  });

  ResponsiblePerson copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? relationToStudent,
    String? phoneNumber,
    DateTime? dateOfBirth,
    String? placeOfBirth,
  }) {
    return ResponsiblePerson(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      relationToStudent: relationToStudent ?? this.relationToStudent,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      placeOfBirth: placeOfBirth ?? this.placeOfBirth,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'relationToStudent': relationToStudent,
      'phoneNumber': phoneNumber,
      'dateOfBirth': dateOfBirth.millisecondsSinceEpoch,
      'placeOfBirth': placeOfBirth,
    };
  }

  factory ResponsiblePerson.fromMap(Map<String, dynamic> map) {
    return ResponsiblePerson(
      id: map['id'] as int,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      relationToStudent: map['relationToStudent'] as String,
      phoneNumber: map['phoneNumber'] as String,
      dateOfBirth:
          DateTime.fromMillisecondsSinceEpoch(map['dateOfBirth'] as int),
      placeOfBirth: map['placeOfBirth'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponsiblePerson.fromJson(String source) =>
      ResponsiblePerson.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ResponsiblePerson(id: $id, firstName: $firstName, lastName: $lastName, relationToStudent: $relationToStudent, phoneNumber: $phoneNumber, dateOfBirth: $dateOfBirth, placeOfBirth: $placeOfBirth)';
  }

  @override
  bool operator ==(covariant ResponsiblePerson other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.relationToStudent == relationToStudent &&
        other.phoneNumber == phoneNumber &&
        other.dateOfBirth == dateOfBirth &&
        other.placeOfBirth == placeOfBirth;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        relationToStudent.hashCode ^
        phoneNumber.hashCode ^
        dateOfBirth.hashCode ^
        placeOfBirth.hashCode;
  }
}
