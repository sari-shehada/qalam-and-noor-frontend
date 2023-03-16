// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:kalam_noor/configs/assets.dart';

class Employee {
  final String employeeId;
  final String firstName;
  final String lastName;
  final bool isMale;
  //enum
  final JobTitle jobTitle;

  Employee({
    required this.employeeId,
    required this.firstName,
    required this.lastName,
    this.isMale = true,
    required this.jobTitle,
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
    String? employeeId,
    String? firstName,
    String? lastName,
    bool? isMale,
    JobTitle? jobTitle,
  }) {
    return Employee(
      employeeId: employeeId ?? this.employeeId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      isMale: isMale ?? this.isMale,
      jobTitle: jobTitle ?? this.jobTitle,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'employeeId': employeeId,
      'firstName': firstName,
      'lastName': lastName,
      'isMale': isMale,
      'jobTitle': jobTitle.index,
    };
  }

  factory Employee.fromMap(Map<String, dynamic> map) {
    return Employee(
      employeeId: map['employeeId'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      isMale: map['isMale'] as bool,
      jobTitle: JobTitle.values[map['jobTitle'] as int],
    );
  }

  String toJson() => json.encode(toMap());

  factory Employee.fromJson(String source) =>
      Employee.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Employee(employeeId: $employeeId, firstName: $firstName, lastName: $lastName, isMale: $isMale, jobTitle: $jobTitle)';
  }

  @override
  bool operator ==(covariant Employee other) {
    if (identical(this, other)) return true;

    return other.employeeId == employeeId &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.isMale == isMale &&
        other.jobTitle == jobTitle;
  }

  @override
  int get hashCode {
    return employeeId.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        isMale.hashCode ^
        jobTitle.hashCode;
  }
}

enum JobTitle {
  secretKeeper,
  socialAdministrator,
  teacher,
}
