import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sam_new/constants/colors.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sam_new/constants/routes.dart';

import '../constants/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          centerTitle: true,
          title: const Text(
            "SAM",
            style:
                TextStyle(fontFamily: "DM_Serif_Display", color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: ColorConstants.whiteText,
                child: Image.asset("assets/animoji.PNG"),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Hello Ansh!",
                    style: TextStyle(
                        fontFamily: "DM_Serif_Display",
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 35)),
                const SizedBox(
                  height: 18,
                ),
                StaggeredGrid.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  children: [
                    StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1.2,
                        child: DateContainer()),
                    const StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2.4,
                        child: WeekAttendance()),
                    const StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1.2,
                        child: AttendanceCurrent())
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text("Dashboard",
                    style: TextStyle(
                        fontFamily: "DM_Serif_Display",
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 24)),
                const SizedBox(
                  height: 16,
                ),
                StaggeredGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  children: [
                    StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 0.65,
                        child: dashboardTile(
                            "Check Attendance",
                            Icons.assessment_outlined,
                            ColorConstants.secondaryColor,
                          checkAttendance
                        )),
                    StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 0.65,
                        child: dashboardTile(
                            "Raise Appeal",
                            Icons.back_hand_outlined,
                            ColorConstants.secondaryColor, raiseAppealPage)),
                    StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 0.65,
                        child: dashboardTile(
                            "Apply Leave",
                            Icons.exit_to_app_outlined,
                            ColorConstants.secondaryColor, leave)),
                    StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 0.65,
                        child: dashboardTile(
                            "Retrain Face",
                            Icons.camera_front_outlined,
                            ColorConstants.secondaryColor, leave)),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  dashboardTile(String s, IconData icon, Color color, String route) {
    const style = TextStyle(fontSize: 16, fontFamily: "DM_Sans");
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(16), color: color),
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              size: 30,
            ),
            Text(s, style: style)
          ],
        ),
      ),
    );
  }
}

class DateContainer extends StatelessWidget {
  DateContainer({Key? key}) : super(key: key);
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorConstants.secondaryColor,
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            months[now.month - 1],
            style: TextStyle(fontFamily: "DM_Sans", fontSize: 18),
          ),
          Text(
            now.day.toString(),
            style: TextStyle(
                fontFamily: "DM_Sans",
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          Text(
            now.year.toString(),
            style: TextStyle(fontFamily: "DM_Sans", fontSize: 18),
          )
        ],
      ),
    );
  }
}

class AttendanceCurrent extends StatelessWidget {
  const AttendanceCurrent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorConstants.secondaryDark,
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Attendance",
            style: TextStyle(fontFamily: "DM_Sans", fontSize: 14),
          ),
          percentageTracker(),
          Text(
            "Completed",
            style: TextStyle(fontFamily: "DM_Sans", fontSize: 14),
          )
        ],
      ),
    );
  }

  percentageTracker() {
    return SizedBox(
      height: 50,
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(
                value: 0.75,
                color: ColorConstants.primaryColor,
              ),
            ),
          ),
          Center(
            child: Text("75%",style: TextStyle(fontFamily: "DM_Sans"),),
          )
        ],
      ),
    );
  }
}

class WeekAttendance extends StatelessWidget {
  const WeekAttendance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorConstants.primaryLight,
          borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Weekly Attendance",
              style: TextStyle(fontSize: 18, fontFamily: "DM_Sans", color: ColorConstants.whiteText),
            ),
            AspectRatio(
              aspectRatio: 1.4,
              child: BarChart(BarChartData(
                  alignment: BarChartAlignment.spaceEvenly,
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(),
                    rightTitles: AxisTitles(),
                    topTitles: AxisTitles(),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: getTitles,
                        reservedSize: 16,
                      ),
                    ),
                  ),
                  barTouchData: BarTouchData(enabled: false),
                  borderData: FlBorderData(show: false),
                  gridData: FlGridData(show: false),
                  barGroups: [
                    generateGroupData(0, 10, 3),
                    generateGroupData(1, 14, 6),
                    generateGroupData(2, 16, 7),
                    generateGroupData(3, 15, 4),
                    generateGroupData(4, 13, 2),
                  ])),
            )
          ],
        ),
      ),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    TextStyle style = TextStyle(fontSize: 14, fontFamily: "DM_Sans", color: ColorConstants.whiteText);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Mon';
        break;
      case 1:
        text = 'Tue';
        break;
      case 2:
        text = 'Wed';
        break;
      case 3:
        text = 'Thu';
        break;
      case 4:
        text = 'Fri';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 2.0,
      child: Text(text, style: style),
    );
  }

  static const betweenSpace = 0.2;

  BarChartGroupData generateGroupData(int x, double present, double absent) {
    return BarChartGroupData(
      x: x,
      groupVertically: true,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: present,
          color: ColorConstants.secondaryColor,
          width: 8,
        ),
        BarChartRodData(
          fromY: present + betweenSpace,
          toY: present + betweenSpace + absent,
          color: ColorConstants.secondaryDark,
          width: 8,
        )
      ],
    );
  }
}
