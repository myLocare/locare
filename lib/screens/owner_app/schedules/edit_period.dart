import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class EditPeriod extends StatefulWidget {
  const EditPeriod({required this.day, required this.PlaceName, super.key});
  final String day;
  final String PlaceName;
  @override
  State<EditPeriod> createState() => _EditPeriodState();
}

class _EditPeriodState extends State<EditPeriod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Locare"),
        backgroundColor: const Color(0xFF345EA8),
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.width * 0.07,
            MediaQuery.of(context).size.width * 0.1,
            MediaQuery.of(context).size.width * 0.07,
            MediaQuery.of(context).size.width * 0.1,
          ),
          child: Column(
            children: [
              Text(widget.PlaceName,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.035,
                      fontWeight: FontWeight.bold)),
              Text(widget.day,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                  )),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Text('Period 1',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Container(
                // make borders
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(62, 158, 158, 158),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                // put padding
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.02,
                  MediaQuery.of(context).size.width * 0.005,
                  MediaQuery.of(context).size.width * 0.002,
                  MediaQuery.of(context).size.width * 0.005,
                ),
                child: Row(
                  children: [
                    Text('From',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.016,
                          fontWeight: FontWeight.bold,
                        )),
                    TimePickerSpinner(
                      alignment: Alignment.center,
                      is24HourMode: false,
                      normalTextStyle: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          color: Colors.grey),
                      highlightedTextStyle: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          color: Colors.black),
                      spacing: 0,
                      itemHeight: 30,
                      isForce2Digits: true,
                      onTimeChange: (time) {
                        setState(() {
                          // _dateTime = time;
                        });
                      },
                    ),
                    Text('To',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.016,
                          fontWeight: FontWeight.bold,
                        )),
                    TimePickerSpinner(
                      alignment: Alignment.center,
                      is24HourMode: false,
                      normalTextStyle: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          color: Colors.grey),
                      highlightedTextStyle: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          color: Colors.black),
                      spacing: 0,
                      itemHeight: 30,
                      isForce2Digits: true,
                      onTimeChange: (time) {
                        setState(() {
                          // _dateTime = time;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
