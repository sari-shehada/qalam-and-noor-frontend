// ignore_for_file: public_member_api_docs, sort_constructors_first
class CurrentSchoolYearInsights {
  final int studentsCount;
  final int classRoomsCount;
  final int classesCount;
  CurrentSchoolYearInsights({
    required this.studentsCount,
    required this.classRoomsCount,
    required this.classesCount,
  });

  CurrentSchoolYearInsights copyWith({
    int? studentsCount,
    int? classRoomsCount,
    int? classesCount,
  }) {
    return CurrentSchoolYearInsights(
      studentsCount: studentsCount ?? this.studentsCount,
      classRoomsCount: classRoomsCount ?? this.classRoomsCount,
      classesCount: classesCount ?? this.classesCount,
    );
  }
}
