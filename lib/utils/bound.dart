abstract class DateBounds {
  static final DateTime left = DateTime(1970);
  static final DateTime right = DateTime(
    DateTime.now().year - 14,
    DateTime.now().month,
    DateTime.now().day,
  );
}

abstract class Durations {
  static const button = Duration(milliseconds: 100);
}
