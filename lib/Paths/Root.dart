

import 'package:carde/Views/homepage.dart';
import 'package:carde/Views/login_page.dart';
import 'package:carde/Widgets/BottomNavBar.dart';
import 'package:flutter/cupertino.dart';

Map <String,WidgetBuilder> get_application_path(){

  return <String,WidgetBuilder>{

    BottomNavBar.pagename:(_)=>BottomNavBar(),
    Homepage.pagename:(_)=>Homepage(),
    LoginPage.pagename:(_)=>LoginPage()
  };
}