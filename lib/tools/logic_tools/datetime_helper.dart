abstract class DateTimeHelper {
  static String getDateWithoutTime(DateTime date) {
    return '${date.day}-${monthAsLabelAR[date.month]}-${date.year}';
  }
}

Map<int, String> monthAsLabelAR = {
  1: 'كانون الثاني',
  2: 'شباط',
  3: 'آذار',
  4: 'نيسان',
  5: 'أيار',
  6: 'حزيران',
  7: 'تموز',
  8: 'آب',
  9: 'أيلول',
  10: 'تشرين الأول',
  11: 'تشرين الثاني',
  12: 'كانون الأول'
};
