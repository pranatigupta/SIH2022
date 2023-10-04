import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sam_new/constants/colors.dart';
import 'package:sam_new/constants/routes.dart';

import '../constants/constants.dart';

class LeavePage extends StatefulWidget {
  const LeavePage({Key? key}) : super(key: key);

  @override
  State<LeavePage> createState() => _LeavePageState();
}

class _LeavePageState extends State<LeavePage> {

  statusIndicator(LeaveStatus status) {
    String statusString = "";
    switch(status){
      case LeaveStatus.AWAITING:
        statusString = "Awaiting";
        break;
      case LeaveStatus.APPROVED:
        statusString = "Approved";
        break;
      case LeaveStatus.DECLINED:
        statusString = "Declined";
        break;
    }
    Color? indicatorColor;
    switch (statusString) {
      case "Approved":
        indicatorColor = Color.fromRGBO(202, 246, 209, 1);
        break;
      case "Awaiting":
        indicatorColor = Color.fromRGBO(221, 203, 137, 1);
        break;
      case "Declined":
        indicatorColor = Color.fromRGBO(229, 194, 193, 1);
        break;
    }
    return Chip(
      label: Text(statusString, style: TextStyle(
          color: Colors.black, fontFamily: "DM_Sans", fontSize: 12.0),),
      backgroundColor: indicatorColor,
    );
  }

  List<LeaveApplication> leaves = [
    LeaveApplication(DateTime.now().subtract(Duration(days: 34)), LeaveStatus.DECLINED, LeaveType.CASUAL),
  LeaveApplication(DateTime.now().subtract(Duration(days: 4)), LeaveStatus.APPROVED, LeaveType.CASUAL),
  LeaveApplication(DateTime.now().add(Duration(days: 34)), LeaveStatus.AWAITING, LeaveType.CASUAL),
  LeaveApplication(DateTime.now(), LeaveStatus.APPROVED, LeaveType.SICK),
  LeaveApplication(DateTime.now(), LeaveStatus.DECLINED, LeaveType.SICK),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            border: Border.all(color: Colors.transparent, width: 0),
            largeTitle: Text("Leaves", style: TextStyle(fontFamily: "DM_Serif_Display"),),
            leading: GestureDetector(child: Icon(Icons.arrow_back_ios, size: 25,), onTap: (){Navigator.pop(context);},),
            trailing: GestureDetector(child: Icon(Icons.add, size: 25,), onTap: (){Navigator.pushNamed(context, applyLeave);},),
            backgroundColor: Colors.white,
          ),
          leaves.isEmpty ? SliverList(
            delegate: SliverChildListDelegate(
              [
                Image.asset("assets/empty.png", scale: 1.4,),
                const Center(child: Text("No Leave Applications 💤", style: TextStyle(fontFamily: "DM_Sans", fontSize: 25, fontWeight: FontWeight.w500),))
              ]
            ),
          ) :
          SliverList(
            delegate: SliverChildListDelegate(
              leaves.map((e) => leaveCards(e.date, e.status, e.type)).toList()
            ),
          )
        ],
      ),
    );
  }

  Card leaveCards(DateTime dateTime, LeaveStatus status, LeaveType type ) {
    String date = DateFormat('EEE, MMM d yyyy' ).format(dateTime);
    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14), side: BorderSide(width: 3.0, color: ColorConstants.secondaryColor)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(date, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "DM_Sans"),),
                    statusIndicator(status)
                  ],
                ),
              ),
              Expanded(child: Align(alignment: Alignment.centerLeft,child: Text(type.name, style: TextStyle(fontSize: 16, fontFamily: "DM_Sans"),)))
            ],
          ),
        ),
      ),
    );
  }
}

class LeaveApplication {
  final DateTime date;
  final LeaveType type;
  final LeaveStatus status;

  const LeaveApplication(this.date, this.status, this.type);
}
