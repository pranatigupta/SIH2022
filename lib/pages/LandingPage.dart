import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sam_new/constants/colors.dart';
import 'package:sam_new/constants/routes.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final pageController = PageController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          colors: [ColorConstants.primaryLight, ColorConstants.primaryColor],
          stops: const [0.1, 0.4],
        )),
        child: Center(
            child: SingleChildScrollView(
              child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
              Image.asset(
                "assets/3dlanding.png",
                scale: 1.3,
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: ColorConstants.secondaryColor),
                  child: PageView(
                    controller: pageController,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              "Smart Attendance Manager",
                              style: TextStyle(
                                  fontFamily: "DM_Serif_Display", fontSize: 30),
                              textAlign: TextAlign.center,
                            ),
                            const Text(
                              "Manage your classes smartly, Never stop learning.",
                              style:
                                  TextStyle(fontFamily: "DM_Sans", fontSize: 15),
                            ),
                            TextButton(
                              onPressed: () {
                                pageController.animateToPage(1,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeIn);
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      ColorConstants.secondaryDark),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.black),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(
                                          vertical: 16, horizontal: 24)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "Get Started",
                                    style: TextStyle(
                                        fontSize: 18, fontFamily: "DM_Sans"),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    size: 18,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 14),
                                    child: GestureDetector(
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                        size: 18,
                                      ),
                                      onTap: () {
                                        pageController.animateToPage(0,
                                            duration: Duration(milliseconds: 500),
                                            curve: Curves.easeIn);
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    "Login",
                                    style: TextStyle(
                                        fontFamily: "DM_Serif_Display",
                                        fontSize: 24),
                                  )
                                ],
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 12),
                                child: Column(
                                  children: [
                                    TextFormField(
                                      cursorColor: ColorConstants.primaryLight,
                                      
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.email,
                                            color: ColorConstants.primaryLight,
                                            ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide:  BorderSide(color: ColorConstants.primaryLight,width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          hintText: "Email",
                                          labelText: "E-Mail",
                                          
                                          labelStyle: TextStyle(
                              color:ColorConstants.primaryLight ,fontFamily: "DM_Sans"
                            )),
                                      controller: _emailController,
                                      // onChanged: (email) {
                                      //   setState(() {
                                      //     _emailController.text = email;
                                      //   });
                                      // },
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    TextFormField(
                                     
                                      obscureText: true,
                                      cursorColor: ColorConstants.primaryLight,
                                      controller: _passController,
                                      // onChanged: (pass) {
                                      //   setState(() {
                                      //     _passController.text = pass;
                                      //   });
                                      // },
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.password,color: ColorConstants.primaryLight,),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide:  BorderSide(color: ColorConstants.primaryLight,width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          hintText: "Password",
                                          labelText: "Password",
                                          labelStyle: TextStyle(
                              color:ColorConstants.primaryLight ,fontFamily: "DM_Sans"
                            )),
                                    )
                                  ],
                                ),
                              ),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, homePage);
                                      },
                                      style: ButtonStyle(
                                          padding: MaterialStateProperty.all(
                                              EdgeInsets.symmetric(
                                                  vertical: 8, horizontal: 24)),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  ColorConstants.secondaryDark),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12)))),
                                      child: Text(
                                        "Login",
                                        style: TextStyle(color: Colors.black,fontFamily: "DM_Sans"),
                                      )))
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
                        ],
                      ),
            )),
      ),
    );
  }
}
