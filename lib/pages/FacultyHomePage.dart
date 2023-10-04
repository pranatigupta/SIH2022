import 'package:flutter/material.dart';

import '../constants/colors.dart';

class FacultyHomePage extends StatefulWidget {
  const FacultyHomePage({Key? key}) : super(key: key);

  @override
  State<FacultyHomePage> createState() => _FacultyHomePageState();
}

class _FacultyHomePageState extends State<FacultyHomePage> {
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
          style: TextStyle(fontFamily: "DM_Serif_Display", color: Colors.black,fontSize: 25),
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
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Good Morning!",
                  style: TextStyle(
                      fontFamily: "DM_Serif_Display",
                      color: Colors.black,
                      //fontWeight: FontWeight.bold,
                      fontSize: 30)),
              const Text("Faculty Name",
                  style: TextStyle(
                      fontFamily: "DM_Serif_Display",
                      color: Colors.black,
                      //fontWeight: FontWeight.bold,
                      fontSize: 25)),
              SizedBox(
                height: 18,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                margin: EdgeInsets.zero,
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              ColorConstants.primaryLight,
                              ColorConstants.primaryColor,
                            ])),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Row(
                                children: [
                                  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text("Name :",style: TextStyle(color: ColorConstants.secondaryColor,fontFamily: "DM_Sans",fontSize: 16,fontWeight: FontWeight.w500),),
                             Text("Faculty Name",style: TextStyle(color: ColorConstants.secondaryColor,fontFamily: "DM_Sans",fontSize: 16))],
                          ),
                          //Spacer(),
                          Expanded(child: Image.asset("assets/animoji.PNG"))
                                ],
                              )),
                          Expanded(
                              child: Row(
                            children: [
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Institute Name :",style: TextStyle(color: ColorConstants.secondaryColor,fontFamily: "DM_Sans",fontSize: 16,fontWeight: FontWeight.w500)),
                                  Text("IIIT Sonepat",style: TextStyle(color: ColorConstants.secondaryColor,fontFamily: "DM_Sans",fontSize: 16))
                                ],
                              )),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Institute ID :",style: TextStyle(color: ColorConstants.secondaryColor,fontFamily: "DM_Sans",fontSize: 16,fontWeight: FontWeight.w500)),
                                  Text("123456",style: TextStyle(color: ColorConstants.secondaryColor,fontFamily: "DM_Sans",fontSize: 16))
                                ],
                              )),
                            ],
                          ))
                        ],
                      ),
                    )),
              ),
              SizedBox(
                height: 18,
              ),
              const Text("Dashboard",
                  style: TextStyle(
                      fontFamily: "DM_Serif_Display",
                      color: Colors.black,
                      //fontWeight: FontWeight.bold,
                      fontSize: 24)),
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: ColorConstants.secondaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.note_alt_outlined,size: 27,),
                            Text(
                              "Check Attendance",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontFamily: "DM_Sans"),
                            ),
                          ],
                        )),
                    Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: ColorConstants.secondaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.edit_outlined,size: 27,),
                            Text(
                              "Manage Requests",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontFamily: "DM_Sans"),
                            ),
                          ],
                        )),
                    Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: ColorConstants.secondaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.bar_chart_rounded,size: 30,),
                            Text(
                              "Semester Metrics",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontFamily: "DM_Sans"),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),
              const Text("Quick Access",
                  style: TextStyle(
                      fontFamily: "DM_Serif_Display",
                      color: Colors.black,
                      //fontWeight: FontWeight.bold,
                      fontSize: 24)),
              Container(
                margin: EdgeInsets.only(top: 12),
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorConstants.secondaryDark),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.camera),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Capture Attendance",style: TextStyle(fontSize: 18,fontFamily: "DM_Sans"),)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
