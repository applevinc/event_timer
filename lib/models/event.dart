import 'package:flutter/material.dart';

class Event {
  String name;
  DateTime date;
  TimeOfDay timeOfDay;
  int secsLeft;
  int minsLeft;
  int hrsLeft;
  int daysLeft;

  Event({
    this.name,
    this.date,
    this.daysLeft,
    this.hrsLeft,
    this.minsLeft,
    this.secsLeft,
  });

  void computeDurationLeft() {
    Duration duration = date.difference(DateTime.now());

    daysLeft = duration.inDays;
    hrsLeft = duration.inHours - (daysLeft * 24);
    minsLeft = duration.inMinutes - (daysLeft * 24 * 60) - (hrsLeft * 60);
    secsLeft = duration.inSeconds -
        (daysLeft * 24 * 60 * 60) -
        (hrsLeft * 60 * 60) -
        (minsLeft * 60);
  }
}
