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
  exam,
  firstExam,
  secondExam,
  finalExam,
}

Map<ExamType, String> examTypeAsString = {
  ExamType.verbal: 'شفهي',
  ExamType.homework: 'وظائف',
  ExamType.activity: 'نشاط',
  ExamType.exam: 'مذاكرة',
  ExamType.finalExam: 'اختبار الفصل',
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
