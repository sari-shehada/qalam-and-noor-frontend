import 'package:flutter/material.dart';

enum Religion {
  islam,
  christianity,
  other,
  undefined,
}

Map<Religion, String> religionAsString = {
  Religion.islam: 'إسلام',
  Religion.christianity: 'المسيحية',
  Religion.other: 'أخرى',
  Religion.undefined: 'غير محدد',
};

enum EducationalStatus {
  none,
  basic,
  middle,
  secondary,
  bachelor,
  master,
  doctorate,
}

Map<EducationalStatus, String> educationalStatusAsString = {
  EducationalStatus.none: 'لا يوجد',
  EducationalStatus.basic: 'أساسي',
  EducationalStatus.middle: 'اعدادي',
  EducationalStatus.secondary: 'ثانوي',
  EducationalStatus.bachelor: 'بكالوريوس',
  EducationalStatus.master: 'ماجستير',
  EducationalStatus.doctorate: 'دكتوراه',
};

enum ConversationStatus {
  open,
  closed,
}

Map<ConversationStatus, String> conversationStatusAsString = {
  ConversationStatus.open: 'مفتوحة',
  ConversationStatus.closed: 'مغلقة',
};

enum ConversationParty {
  other,
  secretKeeper,
  teacher,
  parents,
}

Map<ConversationParty, String> conversationPartyAsString = {
  ConversationParty.other: 'مذاكرة',
  ConversationParty.secretKeeper: 'شفهي',
  ConversationParty.teacher: 'وظائف',
  ConversationParty.parents: 'نشاط',
};

enum ExamType {
  verbal,
  homework,
  activity,
  firstExam,
  secondExam,
  finalExam,
}

Map<ExamType, String> examTypeAsString = {
  ExamType.verbal: 'شفهي',
  ExamType.homework: 'وظائف',
  ExamType.activity: 'نشاط',
  ExamType.firstExam: 'امتحان أول',
  ExamType.secondExam: 'امتحان ثاني',
  ExamType.finalExam: 'امتحان نهائي',
};

enum SemesterType {
  first,
  second,
}

Map<SemesterType, String> semesterTypeAsString = {
  SemesterType.first: 'الأول',
  SemesterType.second: 'الثاني',
};

enum PsychologicalStatusLevel {
  veryLow,
  low,
  medium,
  high,
  veryHigh,
}

Map<PsychologicalStatusLevel, String> psychologicalStatusLevelAsString = {
  PsychologicalStatusLevel.veryLow: 'منخفض جدا',
  PsychologicalStatusLevel.low: 'منخفض',
  PsychologicalStatusLevel.medium: 'متوسط',
  PsychologicalStatusLevel.high: 'عالي',
  PsychologicalStatusLevel.veryHigh: 'عالي جدا',
};

Map<PsychologicalStatusLevel, Color> psychologicalStatusLevelAsColor = {
  PsychologicalStatusLevel.veryLow: const Color(0xFF1E86CF),
  PsychologicalStatusLevel.low: const Color(0xFF5F72AD),
  PsychologicalStatusLevel.medium: const Color(0xFF816193),
  PsychologicalStatusLevel.high: const Color(0xFFAB4971),
  PsychologicalStatusLevel.veryHigh: const Color(0xFFCE2E50),
};

enum StudentStatusEnum {
  new_,
  fail,
  pass,
  notDefined,
}

enum GeneralLoadingStatus {
  isLoading,
  hasData,
  hasError,
}
