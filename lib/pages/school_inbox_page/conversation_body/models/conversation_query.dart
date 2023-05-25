// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:kalam_noor/models/enums.dart';

class ConversationQuery {
  String studentNameOrId;
  //enum
  StudentSearchQueryType studentSearchQueryType;
  //enum
  ConversationStatus conversationStatus;
  ConversationQuery({
    required this.studentNameOrId,
    required this.studentSearchQueryType,
    required this.conversationStatus,
  });

  ConversationQuery copyWith({
    String? studentNameOrId,
    StudentSearchQueryType? studentSearchQueryType,
    ConversationStatus? conversationStatus,
  }) {
    return ConversationQuery(
      studentNameOrId: studentNameOrId ?? this.studentNameOrId,
      studentSearchQueryType:
          studentSearchQueryType ?? this.studentSearchQueryType,
      conversationStatus: conversationStatus ?? this.conversationStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'studentNameOrId': studentNameOrId,
      'studentSearchQueryType': studentSearchQueryType.index,
      'conversationStatus': conversationStatus.index,
    };
  }

  factory ConversationQuery.fromMap(Map<String, dynamic> map) {
    return ConversationQuery(
      studentNameOrId: map['studentNameOrId'] as String,
      studentSearchQueryType:
          StudentSearchQueryType.values[map['studentSearchQueryType'] as int],
      conversationStatus:
          ConversationStatus.values[map['conversationStatus'] as int],
    );
  }

  String toJson() => json.encode(toMap());

  factory ConversationQuery.fromJson(String source) =>
      ConversationQuery.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ConversationQuery(studentNameOrId: $studentNameOrId, studentSearchQueryType: $studentSearchQueryType, conversationStatus: $conversationStatus)';

  @override
  bool operator ==(covariant ConversationQuery other) {
    if (identical(this, other)) return true;

    return other.studentNameOrId == studentNameOrId &&
        other.studentSearchQueryType == studentSearchQueryType &&
        other.conversationStatus == conversationStatus;
  }

  @override
  int get hashCode =>
      studentNameOrId.hashCode ^
      studentSearchQueryType.hashCode ^
      conversationStatus.hashCode;
}

enum StudentSearchQueryType {
  none,
  name,
  publicRecordId,
}
