// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:kalam_noor/models/enums.dart';

class Message {
  int id;
  String title;
  String body;
  //enum
  final ConversationParty sender;
  int sequence;
  DateTime date;
  int conversationId;
  Message({
    required this.id,
    required this.title,
    required this.body,
    required this.sender,
    required this.sequence,
    required this.date,
    required this.conversationId,
  });

  String getMessageSender() {
    return conversationPartyAsString[sender]!;
  }

  Message copyWith({
    int? id,
    String? title,
    String? body,
    ConversationParty? sender,
    int? sequence,
    DateTime? date,
    int? conversationId,
  }) {
    return Message(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      sender: sender ?? this.sender,
      sequence: sequence ?? this.sequence,
      date: date ?? this.date,
      conversationId: conversationId ?? this.conversationId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'body': body,
      'sender': sender.index,
      'sequence': sequence,
      'date': date.toIso8601String(),
      'conversationId': conversationId,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      id: map['id'] as int,
      title: map['title'] as String,
      body: map['body'] as String,
      sender: ConversationParty.values[map['sender'] as int],
      sequence: map['sequence'] as int,
      date: DateTime.parse(map['date']),
      conversationId: map['conversationId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Message(id: $id, title: $title, body: $body, sender: $sender, sequence: $sequence, date: $date, conversationId: $conversationId)';
  }

  @override
  bool operator ==(covariant Message other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.body == body &&
        other.sender == sender &&
        other.sequence == sequence &&
        other.date == date &&
        other.conversationId == conversationId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        body.hashCode ^
        sender.hashCode ^
        sequence.hashCode ^
        date.hashCode ^
        conversationId.hashCode;
  }
}
