
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Family {
  int id;
  String userName;
  String password;
  int fatherId;
  int motherId;
  int? responsiblePersonId;
  Family({
    required this.id,
    required this.userName,
    required this.password,
    required this.fatherId,
    required this.motherId,
    this.responsiblePersonId,
  });

  Family copyWith({
    int? id,
    String? userName,
    String? password,
    int? fatherId,
    int? motherId,
    int? responsiblePersonId,
  }) {
    return Family(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      password: password ?? this.password,
      fatherId: fatherId ?? this.fatherId,
      motherId: motherId ?? this.motherId,
      responsiblePersonId: responsiblePersonId ?? this.responsiblePersonId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userName': userName,
      'password': password,
      'fatherId': fatherId,
      'motherId': motherId,
      'responsiblePersonId': responsiblePersonId,
    };
  }

  factory Family.fromMap(Map<String, dynamic> map) {
    return Family(
      id: map['id'] as int,
      userName: map['userName'] as String,
      password: map['password'] as String,
      fatherId: map['fatherId'] as int,
      motherId: map['motherId'] as int,
      responsiblePersonId: map['responsiblePersonId'] != null
          ? map['responsiblePersonId'] as int
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Family.fromJson(String source) =>
      Family.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Family(id: $id, userName: $userName, password: $password, fatherId: $fatherId, motherId: $motherId, responsiblePersonId: $responsiblePersonId)';
  }

  @override
  bool operator ==(covariant Family other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userName == userName &&
        other.password == password &&
        other.fatherId == fatherId &&
        other.motherId == motherId &&
        other.responsiblePersonId == responsiblePersonId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userName.hashCode ^
        password.hashCode ^
        fatherId.hashCode ^
        motherId.hashCode ^
        responsiblePersonId.hashCode;
  }
}
