import 'package:event_timer/models/event.dart';
import 'package:flutter/cupertino.dart';

class EventListNotifier extends ChangeNotifier {
  List<Event> _events = [];
  List<Event> get events => _events;

  void add(Event event) {
    _events.add(event);
    notifyListeners();
  }

  void delete(int index) {
    _events.removeAt(index);
    notifyListeners();
  }
}
