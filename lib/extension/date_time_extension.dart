
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

extension DateTimeExtension on DateTime { 

  String recordingFormat() {
    return DateFormat("yyyy-MM-dd").format(this);
  }

  String standardForamt({String? locale}) {
    try {
      return DateFormat.yMMMMd(locale ?? "en").format(this);
    } catch (e) {
      return DateFormat("MMMM d, yyyy").format(this);
    }
  }

  String shortStandardForamt({String? locale}) {
    try {
      return DateFormat.yMMMd(locale ?? "en").format(this);
    } catch (e) {
      return DateFormat("MMMM d, yyyy").format(this);
    }
  }

  String timeFormat() {
    return DateFormat("HH:mm").format(this);
  }

  String timeFormatWithAmPm() {
    return DateFormat("hh:mm a").format(this);
  }

  String weekdayName() {
    try {
      return DateFormat("EEEE", "en").format(this);
    } catch (e) {
      return DateFormat("EEEE").format(this);
    }
  }

  int inSeconds() {
    return millisecondsSinceEpoch ~/ 1000;
  }
  
  static DateTime yesterday() {
    return DateTime.now().subtract(const Duration(days:1));
  }

  static DateTime today() {
    return DateTime.now();
  }

  static DateTime tomorrow() {
    return DateTime.now().add(const Duration(days: 1));
  }

  static DateTime dateOnlyToday() {
    return dateOnlyDateTime(today());
  }

  static DateTime dateOnlyYestederday() {
    return dateOnlyDateTime(yesterday());
  }

  static DateTime dateTimeFromToday(int days) {
    return dateOnlyToday().add(Duration(days: days));
  }

  static DateTime fromStandardFormatString(String string, {String? locale}) {
    try { 
      return DateFormat.yMMMMd(locale ?? "en").parse(string);
    } catch (e) {
      return DateFormat("MMMM d, yyyy").parse("January 01, 1970");
    }
  }

  static DateTime fromTimeFormatString(String string) {
    try {
      return DateFormat("HH:mm").parse(string);
    } catch (e) {
      return DateFormat("HH:mm").parse("00:00");
    }
  }

  static DateTime fromTimeOfDay(TimeOfDay timeOfDay) {
    return DateTime(0, 0, 0, timeOfDay.hour, timeOfDay.minute);
  }

  static DateTime dateOnlyDateTime(DateTime dt, {String? locale}) {
    return DateTimeExtension.fromStandardFormatString(dt.standardForamt(), locale: locale);
  }

  String get timeAgoText {
    String text = timeago.format(this, locale: "en_short").replaceAll("~", "");
    return text;
  }
}