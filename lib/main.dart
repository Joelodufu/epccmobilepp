import 'package:flutter/material.dart';
import 'package:flutter_app/pages/detail_page.dart';
import 'package:flutter_app/pages/main_page.dart';
import 'package:flutter_app/navpages/messages_page.dart';
import 'package:flutter_app/pages/welcome_page.dart';

import 'misc/colors.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EPCC APPLICATION',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in a Flutter IDE). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primaryColor: Color(0xFF101484),
      ),
      home: const MainPage(),
    );
  }
}
