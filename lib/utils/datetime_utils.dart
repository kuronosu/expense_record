extension DateTimeUtils on DateTime {
  static const zeroDate = "0000-00-00"; //0000-00-00

  bool isOnlyDate() =>
      hour == 0 && minute == 0 && second == 0 && millisecond == 0;

  bool isOnlyTime() =>
      (year == -1 && month == 11 && day == 30) ||
      (year == 1 && month == 1 && day == 1);

  static DateTime parseTime(String time) => DateTime.parse("${zeroDate}T$time");

  static DateTime time(DateTime dt) => DateTime(
      0, 0, 0, dt.hour, dt.minute, dt.second, dt.millisecond, dt.microsecond);

  static DateTime date(DateTime dt) => DateTime(dt.year, dt.month, dt.day);

  static DateTime timeNow() => time(DateTime.now());

  static DateTime dateNow() => date(DateTime.now());
}
