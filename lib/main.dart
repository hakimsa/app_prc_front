
import 'package:carde/Views/login_page.dart';
import 'package:flutter/material.dart';

import 'Paths/Root.dart';
import 'Utils/cardetheme.dart';
import 'Widgets/BottomNavBar.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final theme = FooderlichTheme.dark();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Card exmpl',
      theme: theme
      ,
     initialRoute: LoginPage.pagename,
     routes: get_application_path(),
    );}}