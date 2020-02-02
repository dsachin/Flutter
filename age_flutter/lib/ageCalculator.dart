class Age {
  DateTime dob = DateTime.utc(1995, 4, 29);
  DateTime now;
  String time = '15';

  String getAge() {
    now = DateTime.now();
    time = (now.difference(dob).inMilliseconds / 31556900000)
        .toStringAsPrecision(11);
    return time;
  }
}
