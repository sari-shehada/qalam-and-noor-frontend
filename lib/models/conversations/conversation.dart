// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:kalam_noor/models/enums.dart';

class Conversation {
  final int id;
  int studentId;
  String title;
  //enum
  final ConversationStatus status;
  //enum
  final ConversationParty originalIssuer;
  Conversation({
    required this.id,
    required this.studentId,
    required this.title,
    required this.status,
    required this.originalIssuer,
  });

  Conversation copyWith({
    int? id,
    int? studentId,
    String? title,
    ConversationStatus? status,
    ConversationParty? originalIssuer,
  }) {
    return Conversation(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      title: title ?? this.title,
      status: status ?? this.status,
      originalIssuer: originalIssuer ?? this.originalIssuer,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'studentId': studentId,
      'title': title,
      'status': status.index,
      'originalIssuer': originalIssuer.index,
    };
  }

  factory Conversation.fromMap(Map<String, dynamic> map) {
    return Conversation(
      id: map['id'] as int,
      studentId: map['studentId'] as int,
      title: map['title'] as String,
      status: ConversationStatus.values[map['status'] as int],
      originalIssuer: ConversationParty.values[map['originalIssuer'] as int],
    );
  }

  String toJson() => json.encode(toMap());

  factory Conversation.fromJson(String source) =>
      Conversation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Conversation(id: $id, studentId: $studentId, title: $title, status: $status, originalIssuer: $originalIssuer)';
  }

  @override
  bool operator ==(covariant Conversation other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.studentId == studentId &&
        other.title == title &&
        other.status == status &&
        other.originalIssuer == originalIssuer;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        studentId.hashCode ^
        title.hashCode ^
        status.hashCode ^
        originalIssuer.hashCode;
  }
}
