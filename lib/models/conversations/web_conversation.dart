// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:kalam_noor/models/enums.dart';

class WebConversation {
  final int id;
  final int studentId;
  final String title;
  //enum
  final ConversationStatus status;
  //enum
  final ConversationParty orginalIssuer;
  final bool isReadOther;
  final bool isReadParent;
  final String studentName;
  final String fatherName;
  final String lastName;
  final String motherName;
  final int publicRecordId;
  WebConversation({
    required this.id,
    required this.studentId,
    required this.title,
    required this.status,
    required this.orginalIssuer,
    required this.isReadOther,
    required this.isReadParent,
    required this.studentName,
    required this.fatherName,
    required this.lastName,
    required this.motherName,
    required this.publicRecordId,
  });

  WebConversation copyWith({
    int? id,
    int? studentId,
    String? title,
    ConversationStatus? status,
    ConversationParty? orginalIssuer,
    bool? isReadOther,
    bool? isReadParent,
    String? studentName,
    String? fatherName,
    String? lastName,
    String? motherName,
    int? publicRecordId,
  }) {
    return WebConversation(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      title: title ?? this.title,
      status: status ?? this.status,
      orginalIssuer: orginalIssuer ?? this.orginalIssuer,
      isReadOther: isReadOther ?? this.isReadOther,
      isReadParent: isReadParent ?? this.isReadParent,
      studentName: studentName ?? this.studentName,
      fatherName: fatherName ?? this.fatherName,
      lastName: lastName ?? this.lastName,
      motherName: motherName ?? this.motherName,
      publicRecordId: publicRecordId ?? this.publicRecordId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'studentId': studentId,
      'title': title,
      'status': status.index,
      'orginalIssuer': orginalIssuer.index,
      'isReadOther': isReadOther,
      'isReadParent': isReadParent,
      'studentName': studentName,
      'fatherName': fatherName,
      'lastName': lastName,
      'motherName': motherName,
      'publicRecordId': publicRecordId,
    };
  }

  factory WebConversation.fromMap(Map<String, dynamic> map) {
    return WebConversation(
      id: map['id'] as int,
      studentId: map['studentId'] as int,
      title: map['title'] as String,
      status: ConversationStatus.values[map['status'] as int],
      orginalIssuer: ConversationParty.values[map['orginalIssuer'] as int],
      isReadOther: map['isReadOther'] as bool,
      isReadParent: map['isReadParent'] as bool,
      studentName: map['studentName'] as String,
      fatherName: map['fatherName'] as String,
      lastName: map['lastName'] as String,
      motherName: map['motherName'] as String,
      publicRecordId: map['publicRecordId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory WebConversation.fromJson(String source) =>
      WebConversation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WebConversation(id: $id, studentId: $studentId, title: $title, status: $status, orginalIssuer: $orginalIssuer, isReadOther: $isReadOther, isReadParent: $isReadParent, studentName: $studentName, fatherName: $fatherName, lastName: $lastName, motherName: $motherName, publicRecordId: $publicRecordId)';
  }

  @override
  bool operator ==(covariant WebConversation other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.studentId == studentId &&
        other.title == title &&
        other.status == status &&
        other.orginalIssuer == orginalIssuer &&
        other.isReadOther == isReadOther &&
        other.isReadParent == isReadParent &&
        other.studentName == studentName &&
        other.fatherName == fatherName &&
        other.lastName == lastName &&
        other.motherName == motherName &&
        other.publicRecordId == publicRecordId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        studentId.hashCode ^
        title.hashCode ^
        status.hashCode ^
        orginalIssuer.hashCode ^
        isReadOther.hashCode ^
        isReadParent.hashCode ^
        studentName.hashCode ^
        fatherName.hashCode ^
        lastName.hashCode ^
        motherName.hashCode ^
        publicRecordId.hashCode;
  }
}
