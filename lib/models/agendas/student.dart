// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:kalam_noor/models/enums.dart';

class Student {
  final int id;
  final int publicRecordId;
  final String firstName;
  final bool isMale;
  final DateTime dateOfBirth;
  final String placeOfBirth;
  final String phoneNumber;
  //enum
  final Religion religion;
  final String whatsappPhoneNumber;
  final String incidentNumber;
  final DateTime incidentDate;
  final String landLine;
  final int addressId;
  final DateTime joinDate;
  final DateTime? leaveDate;
  final int familyId;
  final bool isActive;
  Student({
    required this.id,
    required this.publicRecordId,
    required this.firstName,
    required this.isMale,
    required this.dateOfBirth,
    required this.placeOfBirth,
    required this.phoneNumber,
    required this.religion,
    required this.whatsappPhoneNumber,
    required this.incidentNumber,
    required this.incidentDate,
    required this.landLine,
    required this.addressId,
    required this.joinDate,
    this.leaveDate,
    required this.familyId,
    required this.isActive,
  });

  Student copyWith({
    int? id,
    int? publicRecordId,
    String? firstName,
    bool? isMale,
    DateTime? dateOfBirth,
    String? placeOfBirth,
    String? phoneNumber,
    Religion? religion,
    String? whatsappPhoneNumber,
    String? incidentNumber,
    DateTime? incidentDate,
    String? landLine,
    int? addressId,
    DateTime? joinDate,
    DateTime? leaveDate,
    int? familyId,
    bool? isActive,
  }) {
    return Student(
      id: id ?? this.id,
      publicRecordId: publicRecordId ?? this.publicRecordId,
      firstName: firstName ?? this.firstName,
      isMale: isMale ?? this.isMale,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      placeOfBirth: placeOfBirth ?? this.placeOfBirth,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      religion: religion ?? this.religion,
      whatsappPhoneNumber: whatsappPhoneNumber ?? this.whatsappPhoneNumber,
      incidentNumber: incidentNumber ?? this.incidentNumber,
      incidentDate: incidentDate ?? this.incidentDate,
      landLine: landLine ?? this.landLine,
      addressId: addressId ?? this.addressId,
      joinDate: joinDate ?? this.joinDate,
      leaveDate: leaveDate ?? this.leaveDate,
      familyId: familyId ?? this.familyId,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'publicRecordId': publicRecordId,
      'firstName': firstName,
      'isMale': isMale,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'placeOfBirth': placeOfBirth,
      'phoneNumber': phoneNumber,
      'religion': religion.index,
      'whatsappPhoneNumber': whatsappPhoneNumber,
      'incidentNumber': incidentNumber,
      'incidentDate': incidentDate.toIso8601String(),
      'landLine': landLine,
      'addressId': addressId,
      'joinDate': joinDate.toIso8601String(),
      'leaveDate': leaveDate?.toIso8601String(),
      'familyId': familyId,
      'isActive': isActive,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'] as int,
      publicRecordId: map['publicRecordId'] as int,
      firstName: map['firstName'] as String,
      isMale: map['isMale'] as bool,
      dateOfBirth: DateTime.parse(map['dateOfBirth']),
      placeOfBirth: map['placeOfBirth'] as String,
      phoneNumber: map['phoneNumber'] as String,
      religion: Religion.values[map['religion'] as int],
      whatsappPhoneNumber: map['whatsappPhoneNumber'] as String,
      incidentNumber: map['incidentNumber'] as String,
      incidentDate: DateTime.parse(map['incidentDate']),
      landLine: map['landLine'] as String,
      addressId: map['addressId'] as int,
      joinDate: DateTime.parse(map['joinDate']),
      leaveDate:
          map['leaveDate'] != null ? DateTime.parse(map['leaveDate']) : null,
      familyId: map['familyId'] as int,
      isActive: map['isActive'] as bool,
    );
  }

  int getAge() {
    return (DateTime.now().difference(dateOfBirth).inDays / 365).round();
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) =>
      Student.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Student(id: $id, publicRecordId: $publicRecordId, firstName: $firstName, isMale: $isMale, dateOfBirth: $dateOfBirth, placeOfBirth: $placeOfBirth, phoneNumber: $phoneNumber, religion: $religion, whatsappPhoneNumber: $whatsappPhoneNumber, incidentNumber: $incidentNumber, incidentDate: $incidentDate, landLine: $landLine, addressId: $addressId, joinDate: $joinDate, leaveDate: $leaveDate, familyId: $familyId, isActive: $isActive)';
  }

  @override
  bool operator ==(covariant Student other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.publicRecordId == publicRecordId &&
        other.firstName == firstName &&
        other.isMale == isMale &&
        other.dateOfBirth == dateOfBirth &&
        other.placeOfBirth == placeOfBirth &&
        other.phoneNumber == phoneNumber &&
        other.religion == religion &&
        other.whatsappPhoneNumber == whatsappPhoneNumber &&
        other.incidentNumber == incidentNumber &&
        other.incidentDate == incidentDate &&
        other.landLine == landLine &&
        other.addressId == addressId &&
        other.joinDate == joinDate &&
        other.leaveDate == leaveDate &&
        other.familyId == familyId &&
        other.isActive == isActive;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        publicRecordId.hashCode ^
        firstName.hashCode ^
        isMale.hashCode ^
        dateOfBirth.hashCode ^
        placeOfBirth.hashCode ^
        phoneNumber.hashCode ^
        religion.hashCode ^
        whatsappPhoneNumber.hashCode ^
        incidentNumber.hashCode ^
        incidentDate.hashCode ^
        landLine.hashCode ^
        addressId.hashCode ^
        joinDate.hashCode ^
        leaveDate.hashCode ^
        familyId.hashCode ^
        isActive.hashCode;
  }
}
