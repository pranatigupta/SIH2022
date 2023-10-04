import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';
import 'package:intl/intl.dart';
import 'package:sam_new/constants/colors.dart';

class ApplyLeavePage extends StatefulWidget {
  const ApplyLeavePage({Key? key}) : super(key: key);

  @override
  State<ApplyLeavePage> createState() => _ApplyLeavePageState();
}

class _ApplyLeavePageState extends State<ApplyLeavePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            border: Border.all(color: Colors.transparent, width: 0),
            largeTitle: Text(
              "New Leave",
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

  final DateTime _firstDate = DateTime.now();
  final DateTime _lastDate = DateTime.now().add(Duration(days: 345));
  DatePeriod _selectedPeriod = DatePeriod(DateTime.now(), DateTime.now());
  List<String> _types = ["Casual", "Sick"];
  int _selectedType = 0;
  TextEditingController _type = TextEditingController();

  TextEditingController _description = TextEditingController();
  TextEditingController _dates = TextEditingController();

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
                    hintText: "Type",
                    labelText: "Type",
                    labelStyle: TextStyle(
                              color:ColorConstants.primaryLight ,
                              fontFamily: "DM_Sans"
                            )),
              ),
              // SizedBox(
              //   height: 18,
              // ),
              // TextFormField(
              //   controller: _description,
              //   decoration: InputDecoration(
              //       border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10)),
              //       hintText: "Description",
              //       labelText: "Description"),
              // ),
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
                              color:ColorConstants.primaryLight ,
                              fontFamily: "DM_Sans"
                            )),
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: RangePicker(
                  initiallyShowDate: DateTime.now(),
                  selectedPeriod: _selectedPeriod,
                  onChanged: _onSelectedDateChanged,
                  firstDate: _firstDate,
                  lastDate: _lastDate,
                  datePickerLayoutSettings:
                      DatePickerLayoutSettings(contentPadding: EdgeInsets.zero),
                  datePickerStyles: DatePickerRangeStyles(
                    selectedSingleDateDecoration: BoxDecoration(
                        color: ColorConstants.primaryColor,
                        borderRadius: BorderRadius.circular(12)),
                    selectedDateStyle:
                        TextStyle(color: ColorConstants.secondaryColor),
                    selectedPeriodStartDecoration: BoxDecoration(
                        color: ColorConstants.primaryColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12))),
                    selectedPeriodLastDecoration: BoxDecoration(
                        color: ColorConstants.primaryColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                            bottomRight: Radius.circular(12))),
                    selectedPeriodMiddleDecoration:
                        BoxDecoration(color: ColorConstants.primaryColor),
                  ),
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
