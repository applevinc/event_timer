import 'package:event_timer/notifiers/event_list_notifier.dart';
import 'package:event_timer/view/screens/home/components/bottom_sheet.dart';
import 'package:event_timer/view/screens/home/components/event_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var eventListNotifier = context.watch<EventListNotifier>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Event Timer',
          style: Theme.of(context).textTheme.headline4.apply(color: Colors.white),
        ),
      ),
      body: (eventListNotifier.events.isEmpty)
          ? Center(
              child: Text(
                "No Event",
                style: Theme.of(context).textTheme.headline4,
              ),
            )
          : _EventListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet<void>(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return AddEventBottomSheet();
            },
          );
        },
      ),
    );
  }
}

class _EventListView extends StatelessWidget {
  const _EventListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var eventListNotifier = context.watch<EventListNotifier>();

    return ListView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(20.w),
      itemCount: eventListNotifier.events.length,
      itemBuilder: (context, index) {
        var event = eventListNotifier.events[index];
        return EventCard(event);
      },
    );
  }
}
