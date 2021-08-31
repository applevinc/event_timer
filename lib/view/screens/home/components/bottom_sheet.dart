import 'package:event_timer/view/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddEventBottomSheet extends StatelessWidget {
  const AddEventBottomSheet({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            ),
            RequiredText(),
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
                        //send picked date to countdown
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
                        //send picked time to countdown
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
                // start countdown
              },
            )
          ],
        ),
      ),
    );
  }
}

class RequiredText extends StatelessWidget {
  const RequiredText({
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
                style: Theme.of(context).textTheme.headline6.apply(color: Colors.white),
              ),
            ),
            Visibility(
              visible: required,
              child: RequiredText(),
            ),
          ],
        ),
      ),
    );
  }
}
