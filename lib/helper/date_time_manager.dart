class DateTimeManager {
  static DateTime fromUTC(String dateAndTime) {
    DateTime dateTime;
    dateTime = DateTime.parse(dateAndTime);
    return dateTime.toLocal();
  }

  static String fromLocal(DateTime dateAndTime) {
    String dateTime;
    dateTime = dateAndTime.toString();
    return dateTime;
  }
}

mixin DateTimeConverter {
  DateTime toLocal(DateTime utcDateTime) {
    return utcDateTime.toLocal();
  }

  DateTime toUtc(DateTime localDateTime) {
    return localDateTime.toUtc();
  }
}
