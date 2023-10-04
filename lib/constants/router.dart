import 'package:flutter/material.dart';
import 'package:sam_new/constants/routes.dart';
import 'package:sam_new/pages/ApplyLeavePage.dart';
import 'package:sam_new/pages/FacultyHomePage.dart';
import 'package:sam_new/pages/LeavePage.dart';
import 'package:sam_new/pages/CheckAttendance.dart';
import 'package:sam_new/pages/HomePage.dart';
import 'package:sam_new/pages/LandingPage.dart';
import 'package:sam_new/pages/NewAppealPage.dart';

import '../pages/RaiseAppealPage.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case landingPage:
        return MaterialPageRoute(builder: (_) => LandingPage());
      case  homePage:
        return MaterialPageRoute(builder: (_) => HomePage());
      case checkAttendance:
        return MaterialPageRoute(builder: (_) => CheckAttendance());
      case leave:
        return MaterialPageRoute(builder: (_) => LeavePage());
      case applyLeave:
        return MaterialPageRoute(builder: (_) => ApplyLeavePage());
      case facultyHomePage:
        return MaterialPageRoute(builder: (_) => FacultyHomePage());
      case raiseAppealPage:
        return MaterialPageRoute(builder: (_) => RaiseAppealPage());
      case newAppealPage:
        return MaterialPageRoute(builder: (_) => NewAppealPage());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(body: Center(child: Text("No Route Found"),),));
    }
  }
}
