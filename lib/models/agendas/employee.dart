// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:kalam_noor/configs/assets.dart';

class Employee {
  final String id;
  final String firstName;
  final String lastName;
  final String fatherName;
  final String motherName;
  final bool isMale; //TODO: Add to ERD
  DateTime dateOfBirth;
  String phoneNumber;
  DateTime startDate;
  int numberOfChildren;
  double salary;
  int jobTitleId;
  int addressId;

  Employee({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.fatherName,
    required this.motherName,
    this.isMale = true,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.startDate,
    required this.numberOfChildren,
    required this.salary,
    required this.jobTitleId,
    required this.addressId,
  });

  String getAvatarImage({bool circular = false}) {
    if (circular) {
      if (isMale) {
        return GlobalAssets.maleAvatarCircular;
      } else {
        return GlobalAssets.femaleAvatarCircular;
      }
    }
    if (isMale) {
      return GlobalAssets.maleAvatar;
    }
    return GlobalAssets.femaleAvatar;
  }

  Employee copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? fatherName,
    String? motherName,
    bool? isMale,
    DateTime? dateOfBirth,
    String? phoneNumber,
    DateTime? startDate,
    int? numberOfChildren,
    double? salary,
    int? jobTitleId,
    int? addressId,
  }) {
    return Employee(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      fatherName: fatherName ?? this.fatherName,
      motherName: motherName ?? this.motherName,
      isMale: isMale ?? this.isMale,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      startDate: startDate ?? this.startDate,
      numberOfChildren: numberOfChildren ?? this.numberOfChildren,
      salary: salary ?? this.salary,
      jobTitleId: jobTitleId ?? this.jobTitleId,
      addressId: addressId ?? this.addressId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'fatherName': fatherName,
      'motherName': motherName,
      'isMale': isMale,
      'dateOfBirth': dateOfBirth.millisecondsSinceEpoch,
      'phoneNumber': phoneNumber,
      'startDate': startDate.millisecondsSinceEpoch,
      'numberOfChildren': numberOfChildren,
      'salary': salary,
      'jobTitleId': jobTitleId,
      'addressId': addressId,
    };
  }

  factory Employee.fromMap(Map<String, dynamic> map) {
    return Employee(
      id: map['id'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      fatherName: map['fatherName'] as String,
      motherName: map['motherName'] as String,
      isMale: map['isMale'] as bool,
      dateOfBirth:
          DateTime.fromMillisecondsSinceEpoch(map['dateOfBirth'] as int),
      phoneNumber: map['phoneNumber'] as String,
      startDate: DateTime.fromMillisecondsSinceEpoch(map['startDate'] as int),
      numberOfChildren: map['numberOfChildren'] as int,
      salary: map['salary'] as double,
      jobTitleId: map['jobTitleId'] as int,
      addressId: map['addressId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Employee.fromJson(String source) =>
      Employee.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Employee(id: $id, firstName: $firstName, lastName: $lastName, fatherName: $fatherName, motherName: $motherName, isMale: $isMale, dateOfBirth: $dateOfBirth, phoneNumber: $phoneNumber, startDate: $startDate, numberOfChildren: $numberOfChildren, salary: $salary, jobTitleId: $jobTitleId, addressId: $addressId)';
  }

  @override
  bool operator ==(covariant Employee other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.fatherName == fatherName &&
        other.motherName == motherName &&
        other.isMale == isMale &&
        other.dateOfBirth == dateOfBirth &&
        other.phoneNumber == phoneNumber &&
        other.startDate == startDate &&
        other.numberOfChildren == numberOfChildren &&
        other.salary == salary &&
        other.jobTitleId == jobTitleId &&
        other.addressId == addressId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        fatherName.hashCode ^
        motherName.hashCode ^
        isMale.hashCode ^
        dateOfBirth.hashCode ^
        phoneNumber.hashCode ^
        startDate.hashCode ^
        numberOfChildren.hashCode ^
        salary.hashCode ^
        jobTitleId.hashCode ^
        addressId.hashCode;
  }
}

enum JobTitle {
  secretKeeper,
  socialAdministrator,
  teacher,
}
