import 'package:event_timer/notifiers/event_list_notifier.dart';
import 'package:event_timer/view/screens/home/home.dart';
import 'package:event_timer/view/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: () => ChangeNotifierProvider(
        create: (context) => EventListNotifier(),
        child: MaterialApp(
          title: 'Event Timer',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.defaultTheme,
          home: HomeScreen(),
        ),
      ),
    );
  }
}
