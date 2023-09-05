import 'package:intl/intl.dart';

String secondToHHMMSSformat({required int second}) {
  int s = second % 60;
  int m = ((second % 3600) / 60).floor();
  int h = (second / 3600).floor();
  String ss = s.toString().length <= 1 ? "0$s" : "$s";
  String mm = m.toString().length <= 1 ? "0$m" : "$m";
  String hh = h.toString().length <= 1 ? "0$h" : "$h";

  return "$hh : $mm : $ss";
}

String secondToSSorMMorHH({required int second}) {
  if (second / 60 < 1) {
    return "${second}s";
  } else if (second / 3600 < 1) {
    return "${(second / 60).floor()}m";
  } else {
    return "${(second / 3600).floor()}h";
  }
}

int getCurrentDate() {
  return DateFormat("yyyy-MM-dd")
      .parse(DateTime.now().toString())
      .millisecondsSinceEpoch;
}
