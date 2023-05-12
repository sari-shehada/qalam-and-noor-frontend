abstract class DateTimeHelper {
  static String getDateWithoutTime(DateTime date, {String separator = '/'}) {
    String dateAsString =
        '${date.day}-${monthAsLabelAR[date.month]}-${date.year}';
    if (separator != '-') {
      dateAsString = dateAsString.split('-').join(separator);
    }
    return dateAsString;
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
