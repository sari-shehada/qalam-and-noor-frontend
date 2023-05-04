// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:kalam_noor/models/agendas/employee.dart';
import 'package:kalam_noor/models/agendas/job_title.dart';

class EmployeeAuthModel {
  final Employee? employee;
  final JobTitle? jobTitle;
  final bool success;
  final String message;
  EmployeeAuthModel({
    this.employee,
    this.jobTitle,
    required this.success,
    required this.message,
  });

  EmployeeAuthModel copyWith({
    Employee? employee,
    JobTitle? jobTitle,
    bool? success,
    String? message,
  }) {
    return EmployeeAuthModel(
      employee: employee ?? this.employee,
      jobTitle: jobTitle ?? this.jobTitle,
      success: success ?? this.success,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'employee': employee?.toMap(),
      'jobTitle': jobTitle?.toMap(),
      'success': success,
      'message': message,
    };
  }

  factory EmployeeAuthModel.fromMap(Map<String, dynamic> map) {
    return EmployeeAuthModel(
      employee: map['employee'] != null
          ? Employee.fromMap(map['employee'] as Map<String, dynamic>)
          : null,
      jobTitle: map['jobTitle'] != null
          ? JobTitle.fromMap(map['jobTitle'] as Map<String, dynamic>)
          : null,
      success: map['success'] as bool,
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory EmployeeAuthModel.fromJson(String source) =>
      EmployeeAuthModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EmployeeAuthModel(employee: $employee, jobTitle: $jobTitle, success: $success, message: $message)';
  }

  @override
  bool operator ==(covariant EmployeeAuthModel other) {
    if (identical(this, other)) return true;

    return other.employee == employee &&
        other.jobTitle == jobTitle &&
        other.success == success &&
        other.message == message;
  }

  @override
  int get hashCode {
    return employee.hashCode ^
        jobTitle.hashCode ^
        success.hashCode ^
        message.hashCode;
  }
}
