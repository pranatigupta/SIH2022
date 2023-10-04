import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sam_new/constants/colors.dart';
import 'package:sam_new/constants/constants.dart';
import '../widgets/CalendarTimeline.dart';

class CheckAttendance extends StatefulWidget {
  const CheckAttendance({Key? key}) : super(key: key);

  @override
  State<CheckAttendance> createState() => _CheckAttendanceState();
}

var rng = new Random();

class _CheckAttendanceState extends State<CheckAttendance> {
  DateTime now = DateTime.now();
  late DateTime selectedIndex;

  @override
  void initState() {
    super.initState();
  }


  List<double> testPercentages = List.generate(10, (index) => rng.nextDouble());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalendarAppBar(
        // TODO: just to check
        onDateChanged: (value) => setState((){
          testPercentages = List.generate(10, (index) => rng.nextDouble());
        }),
        firstDate: DateTime.now().subtract(Duration(days: 140)),
        lastDate: DateTime.now(),
        accent: ColorConstants.primaryColor,
        white: ColorConstants.secondaryColor,
        black: Colors.black,
        fontFamily: "DM_Sans",
      ),

      body: SingleChildScrollView(
        child: Column(
          children: testPercentages.map((e) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: SubjectAttendanceCard(percentage: e,),
          )).toList()
        ),
      ),
    );
  }
}

class SubjectAttendanceCard extends StatelessWidget {
  final double percentage;
  SubjectAttendanceCard({Key? key, required this.percentage}) : super(key: key);

  attendanceIndicator(double percentage) {
    String indicator = percentage >= 0.75 ? "Present" : "Absent";
    Color? indicatorColor;
    IconData? icon;
    switch (indicator){
      case "Present":
        indicatorColor = Color.fromRGBO(202, 246, 209, 1);
        icon = Icons.check;
        break;
      // case "Manageable":
      //   indicatorColor = Color.fromRGBO(221, 203, 137, 1);
      //   icon = Icons.balance_outlined;
      //   break;
      case "Absent":
        indicatorColor = Color.fromRGBO(229, 194, 193, 1);
        icon = Icons.dangerous_outlined;
        break;
    }
    return Chip(
        label: Text(indicator, style: TextStyle(color: Colors.black, fontFamily: "DM_Sans", fontSize: 12.0),),
      avatar: Icon(icon, color: ColorConstants.black, size: 14,),
      backgroundColor: indicatorColor,
    );

    // TODO: remove this
    // return Container(
    //   padding: EdgeInsets.all(8),
    //   decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(5),
    //       color: indicatorColor
    //   ),
    //   child: Center(
    //       child: Row(
    //         children: [
    //           Padding(
    //             padding: const EdgeInsets.only(right: 4),
    //             child: Icon(icon, color: ColorConstants.black, size: 12,),
    //           ),
    //           Text(indicator, style: TextStyle(color: Colors.black, fontFamily: "DM_Sans", fontSize: 12.0),),
    //         ],
    //       )
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: MediaQuery.of(context).size.height*0.1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("Subject Name", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "DM_Serif_Display", fontSize: 20),),
                      //Text("6 out of 10 classes", style: TextStyle(fontFamily: "DM_Sans", fontSize: 14),),
                    ],
                  ),
                  attendanceIndicator(percentage)
                ],
              ),
              // LinearPercentIndicator(
              //   barRadius: Radius.circular(32),
              //   animation: true,
              //   lineHeight: 10.0,
              //   animationDuration: 1000,
              //   percent: percentage,
              //   progressColor: ColorConstants.secondaryDark,
              //   padding: EdgeInsets.zero,
              //   backgroundColor: ColorConstants.primaryLight,
              // )
            ],
          ),
        ),
      ),
    );
  }
}

