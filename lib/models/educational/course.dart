// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Course {
  int id;
  int classId;
  int teacherId;
  String name;
  num totalGrade;
  bool isEnriching;
  num requiredGradeToPass;
  bool requiredToPass;

  Course({
    required this.id,
    required this.classId,
    required this.teacherId,
    required this.name,
    required this.totalGrade,
    required this.isEnriching,
    required this.requiredGradeToPass,
    required this.requiredToPass,
  });

  Course copyWith({
    int? id,
    int? classId,
    int? teacherId,
    String? name,
    num? totalGrade,
    bool? isEnriching,
    num? requiredGradeToPass,
    bool? requiredToPass,
  }) {
    return Course(
      id: id ?? this.id,
      classId: classId ?? this.classId,
      teacherId: teacherId ?? this.teacherId,
      name: name ?? this.name,
      totalGrade: totalGrade ?? this.totalGrade,
      isEnriching: isEnriching ?? this.isEnriching,
      requiredGradeToPass: requiredGradeToPass ?? this.requiredGradeToPass,
      requiredToPass: requiredToPass ?? this.requiredToPass,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'classId': classId,
      'teacherId': teacherId,
      'name': name,
      'totalGrade': totalGrade,
      'isEnriching': isEnriching,
      'requiredGradeToPass': requiredGradeToPass,
      'requiredToPass': requiredToPass,
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      id: map['id'] as int,
      classId: map['classId'] as int,
      teacherId: map['teacherId'] as int,
      name: map['name'] as String,
      totalGrade: map['totalGrade'] as num,
      isEnriching: map['isEnriching'] as bool,
      requiredGradeToPass: map['requiredGradeToPass'] as num,
      requiredToPass: map['requiredToPass'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Course.fromJson(String source) =>
      Course.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Course(id: $id, classId: $classId, teacherId: $teacherId, name: $name, totalGrade: $totalGrade, isEnriching: $isEnriching, requiredGradeToPass: $requiredGradeToPass, requiredToPass: $requiredToPass)';
  }

  @override
  bool operator ==(covariant Course other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.classId == classId &&
        other.teacherId == teacherId &&
        other.name == name &&
        other.totalGrade == totalGrade &&
        other.isEnriching == isEnriching &&
        other.requiredGradeToPass == requiredGradeToPass &&
        other.requiredToPass == requiredToPass;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        classId.hashCode ^
        teacherId.hashCode ^
        name.hashCode ^
        totalGrade.hashCode ^
        isEnriching.hashCode ^
        requiredGradeToPass.hashCode ^
        requiredToPass.hashCode;
  }
}
