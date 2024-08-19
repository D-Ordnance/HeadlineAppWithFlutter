import 'package:first_flutter_application/core/constant/constant.dart';
import 'package:first_flutter_application/headline/pages/home_screen.dart';
import 'package:first_flutter_application/headline/pages/web_screen_with_push_name.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      initialRoute: HeadLineConstant.home,
      routes: {
        HeadLineConstant.web: (context) => WebPageWithPushNamed(),
      },
      home: const MyHomeScreen(),
    );
  }
}
