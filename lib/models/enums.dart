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
