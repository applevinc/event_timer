import 'package:event_timer/view/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 159.h,
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 20.w),
      decoration: BoxDecoration(
        color: AppColors.dark_grey,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Event Event',
                style: Theme.of(context).textTheme.headline6.apply(
                      color: AppColors.light_grey,
                    ),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: 'Edit',
                  icon: Icon(
                    Icons.more_vert,
                    color: AppColors.darker_grey,
                    size: 40.sp,
                  ),
                  style: Theme.of(context).textTheme.headline6,
                  onChanged: (String newValue) {
                    // setState(() {
                    //   dropdownValue = newValue;
                    // });
                  },
                  items: <String>['Edit', 'Delete']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              EventCountdownItem(),
              SizedBox(width: 5.w),
              EventCountdownItem(),
              SizedBox(width: 5.w),
              EventCountdownItem(),
            ],
          )
        ],
      ),
    );
  }
}

class EventCountdownItem extends StatelessWidget {
  const EventCountdownItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.h,
      width: 75.w,
      decoration: BoxDecoration(
        color: AppColors.darker_grey,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('00',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .apply(color: AppColors.light_grey)),
          SizedBox(height: 5.h),
          Text('Days',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .apply(color: AppColors.dark_grey)),
        ],
      ),
    );
  }
}
