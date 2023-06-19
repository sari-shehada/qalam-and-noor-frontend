// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/end_current_seemster_dialog/models/class_reports_dto.dart';

class EndSemesterRequestResultModel {
  final String message;
  final bool success;
  final ClassReportsDTO? classReportsDTO;
  EndSemesterRequestResultModel({
    required this.message,
    required this.success,
    required this.classReportsDTO,
  });

  EndSemesterRequestResultModel copyWith({
    String? message,
    bool? success,
    ClassReportsDTO? classReportsDTO,
  }) {
    return EndSemesterRequestResultModel(
      message: message ?? this.message,
      success: success ?? this.success,
      classReportsDTO: classReportsDTO ?? this.classReportsDTO,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'success': success,
      'classReportsDTO': classReportsDTO?.toMap(),
    };
  }

  factory EndSemesterRequestResultModel.fromMap(Map<String, dynamic> map) {
    return EndSemesterRequestResultModel(
      message: map['message'] as String,
      success: map['success'] as bool,
      classReportsDTO: map['classReportsDTO'] != null
          ? ClassReportsDTO.fromMap(
              map['classReportsDTO'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EndSemesterRequestResultModel.fromJson(String source) =>
      EndSemesterRequestResultModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'EndSemesterRequestResultModel(message: $message, success: $success, classReportsDTO: $classReportsDTO)';

  @override
  bool operator ==(covariant EndSemesterRequestResultModel other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.success == success &&
        other.classReportsDTO == classReportsDTO;
  }

  @override
  int get hashCode =>
      message.hashCode ^ success.hashCode ^ classReportsDTO.hashCode;
}
