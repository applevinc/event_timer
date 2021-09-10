import 'package:event_timer/models/event.dart';
import 'package:event_timer/notifiers/event_list_notifier.dart';
import 'package:event_timer/view/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AddEventBottomSheet extends StatefulWidget {
  const AddEventBottomSheet({
    Key key,
  }) : super(key: key);

  @override
  _AddEventBottomSheetState createState() => _AddEventBottomSheetState();
}

class _AddEventBottomSheetState extends State<AddEventBottomSheet> {
  final newEvent = Event();

  @override
  Widget build(BuildContext context) {
    var eventListNotifier = context.watch<EventListNotifier>();

    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        height: 373.h,
        color: AppColors.light_grey,
        padding: EdgeInsets.all(30.sp),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter Event Name',
              ),
              onChanged: (value) {
                newEvent.name = value;
              },
            ),
            _RequiredText(),
            SizedBox(height: 15.h),
            SizedBox(
              height: 106.h,
              child: Row(
                children: [
                  CustomButton(
                    label: 'Date',
                    required: true,
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.utc(3000, 12, 1),
                      ).then((value) {
                        newEvent.date = value;
                      });
                    },
                  ),
                  SizedBox(width: 10.w),
                  CustomButton(
                    label: 'Time',
                    onTap: () {
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                        builder: (BuildContext context, Widget child) {
                          return Directionality(
                              textDirection: TextDirection.rtl, child: child);
                        },
                      ).then((value) {
                        newEvent.timeOfDay = value;
                      });
                    },
                  )
                ],
              ),
            ),
            SizedBox(height: 15.h),
            CustomButton(
              label: 'Start',
              onTap: () {
                print(newEvent.name);
                newEvent.computeDurationLeft();
                eventListNotifier.add(newEvent);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}

class _RequiredText extends StatelessWidget {
  const _RequiredText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        'Required',
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key,
    this.label,
    this.onTap,
    this.required = false,
  }) : super(key: key);

  final String label;
  final Function onTap;
  final bool required;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.darker_grey,
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.symmetric(vertical: 30.h),
              child: Text(
                label,
                style:
                    Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
              ),
            ),
            Visibility(
              visible: required,
              child: _RequiredText(),
            ),
          ],
        ),
      ),
    );
  }
}
