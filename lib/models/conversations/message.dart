// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:kalam_noor/models/enums.dart';

class Message {
  int id;
  String body;
  //enum
  final ConversationParty sender;
  DateTime date;
  int conversationId;
  Message({
    required this.id,
    required this.body,
    required this.sender,
    required this.date,
    required this.conversationId,
  });

  String getMessageSender() {
    return conversationPartyAsString[sender]!;
  }

  Message copyWith({
    int? id,
    String? body,
    ConversationParty? sender,
    DateTime? date,
    int? conversationId,
  }) {
    return Message(
      id: id ?? this.id,
      body: body ?? this.body,
      sender: sender ?? this.sender,
      date: date ?? this.date,
      conversationId: conversationId ?? this.conversationId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'body': body,
      'sender': sender.index,
      'date': date.millisecondsSinceEpoch.toString(),
      'conversationId': conversationId,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      id: map['id'] as int,
      body: map['body'] as String,
      sender: ConversationParty.values[map['sender'] as int],
      date: DateTime.fromMillisecondsSinceEpoch(
        int.parse(map['date'] as String),
      ),
      conversationId: map['conversationId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Message(id: $id, body: $body, sender: $sender, date: $date, conversationId: $conversationId)';
  }

  @override
  bool operator ==(covariant Message other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.body == body &&
        other.sender == sender &&
        other.date == date &&
        other.conversationId == conversationId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        body.hashCode ^
        sender.hashCode ^
        date.hashCode ^
        conversationId.hashCode;
  }
}
