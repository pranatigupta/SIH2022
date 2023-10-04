import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';
import 'package:intl/intl.dart';
import 'package:sam_new/constants/colors.dart';

class NewAppealPage extends StatefulWidget {
  const NewAppealPage({Key? key}) : super(key: key);

  @override
  State<NewAppealPage> createState() => _NewAppealPageState();
}

class _NewAppealPageState extends State<NewAppealPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            border: Border.all(color: Colors.transparent, width: 0),
            largeTitle: Text(
              "Raise Appeal",
              style: TextStyle(fontFamily: "DM_Serif_Display"),
            ),
            leading: GestureDetector(
              child: Icon(
                Icons.arrow_back_ios,
                size: 25,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: Colors.white,
          ),
          SliverList(
            delegate: SliverChildListDelegate(form()),
          )
        ],
      ),
    );
  }

  final DateTime _lastDate = DateTime.now();
  
  final DateTime _firstDate = DateTime.now().subtract(Duration(days: 345));
  DatePeriod _selectedPeriod = DatePeriod(DateTime.now(), DateTime.now());
  List<String> _types = ["Mann", "Rahul"];
  int _selectedType = 0;
  TextEditingController _type = TextEditingController();

  TextEditingController _description = TextEditingController();
  TextEditingController _dates = TextEditingController();
  DateTime _selectedDay = DateTime.now();

  DatePickerRangeStyles styles = DatePickerRangeStyles(
    currentDateStyle: TextStyle(color: Colors.black),
      selectedSingleDateDecoration: BoxDecoration(
        color: ColorConstants.primaryLight,
        shape: BoxShape.circle,
      ),
      dayHeaderStyle: DayHeaderStyle(
        textStyle: TextStyle(
          color: ColorConstants.primaryLight,
        ),
      ),
      // dayHeaderTitleBuilder: _dayHeaderTitleBuilder,
    );

  List<Widget> form() {
    return [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                readOnly: true,
                controller: _type,
                onTap: () => showCupertinoModalPopup(
                    context: context,
                    builder: (context) => Container(
                          height: 216,
                          decoration: BoxDecoration(
                              color: ColorConstants.secondaryColor,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(16),
                                  topLeft: Radius.circular(16))),
                          padding: const EdgeInsets.only(top: 6.0),
                          margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: SafeArea(
                            top: false,
                            child: CupertinoPicker(
                              onSelectedItemChanged: (int value) {
                                _type.text = _types[value];
                              },
                              itemExtent: 50,
                              children: List.generate(
                                  _types.length,
                                  (index) => Center(
                                        child: Text(_types[index]),
                                      )),
                            ),
                          ),
                        )),
                        cursorColor: ColorConstants.primaryLight,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:  BorderSide(color: ColorConstants.primaryLight,width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Faculty Name",
                    labelText: "Faculty Name",
                    labelStyle: TextStyle(
                              color:ColorConstants.primaryLight ,fontFamily: "DM_Sans"
                            )),
              ),
              // SizedBox(
              //   height: 18,
              // ),
              // TextFormField(
              //    cursorColor: ColorConstants.primaryLight,
              //   controller: _description,
              //   decoration: InputDecoration(
              //       focusedBorder: OutlineInputBorder(
              //          borderSide:  BorderSide(color: ColorConstants.primaryLight,width: 1),
              //           borderRadius: BorderRadius.circular(10)),
              //       hintText: "Description",
              //       labelText: "Description",
              //       labelStyle: TextStyle(
              //                 color:ColorConstants.primaryLight 
              //               )),
              // ),
              SizedBox(
                height: 18,
              ),
              TextFormField(
                //readOnly: true,
                controller: _type,
                
                        cursorColor: ColorConstants.primaryLight,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:  BorderSide(color: ColorConstants.primaryLight,width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Description",
                    labelText: "Description",
                    labelStyle: TextStyle(
                              color:ColorConstants.primaryLight ,fontFamily: "DM_Sans"
                            )),
              ),
              SizedBox(
                height: 18,
              ),
              TextFormField(
                cursorColor: ColorConstants.primaryLight,
                controller: _dates,
                readOnly: true,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:  BorderSide(color: ColorConstants.primaryLight,width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Dates",
                    labelText: "Dates",
                    labelStyle: TextStyle(
                              color:ColorConstants.primaryLight ,fontFamily: "DM_Sans"
                            )),
                    
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: DayPicker.single(
                  datePickerStyles: styles,
                  firstDate: _firstDate,
                  lastDate: _lastDate, 
                  onChanged: (DateTime value) { 
                    setState(() {
                       _selectedDay = value;
                       DateFormat formatter = DateFormat("dd/MM/yyyy");
                       _dates.text = formatter.format(_selectedDay);
                    });
                   
                   }, 
                  selectedDate: _selectedDay ,
                  //TODO: add color to selected date 
                  
                ),
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  print(_selectedPeriod.start.toString() +
                      "-" +
                      _selectedPeriod.end.toString());
                },
                child: Container(
                  child: Center(
                      child: Text(
                    "Submit",
                    style: TextStyle(color: ColorConstants.secondaryColor,fontFamily: "DM_Sans"),
                  )),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(ColorConstants.primaryLight)),
              )
            ],
          ),
        ),
      )
    ];
  }

  void _onSelectedDateChanged(DatePeriod newPeriod) {
    DateFormat formatter = DateFormat("dd/MM/yyyy");
    String dates = "";
    if (newPeriod.start.day == newPeriod.end.day) {
      dates = formatter.format(newPeriod.start);
    } else {
      dates = formatter.format(newPeriod.start) +
          " - " +
          formatter.format(newPeriod.end);
    }
    setState(() {
      _selectedPeriod = newPeriod;
      _dates.text = dates;
    });
  }
}
