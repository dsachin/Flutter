class Age {
  static DateTime dob = DateTime.utc(1995, 4, 29);
  static String time = '15';

  String getAge() {
    DateTime now = DateTime.now();
    time = (now.difference(dob).inMilliseconds / 31556900000)
        .toStringAsPrecision(12);
    return time;
  }
}
