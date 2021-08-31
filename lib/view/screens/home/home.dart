import 'package:event_timer/view/screens/home/components/bottom_sheet.dart';
import 'package:event_timer/view/screens/home/components/event_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Event Timer',
          style: Theme.of(context).textTheme.headline4.apply(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(20.w),
        itemCount: 5,
        itemBuilder: (context, index) {
          return EventCard();
        },
      ),
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
