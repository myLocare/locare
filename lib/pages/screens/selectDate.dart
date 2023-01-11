// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:locare/pages/screens/paymentPage.dart';

class SelectDate extends StatefulWidget {
  const SelectDate({super.key});

  @override
  State<SelectDate> createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      //appbar with back button
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'When are you planning to come?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const Text(
              'Choose the desired date and time',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w100),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Expanded(
              child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 12.0,
                        spreadRadius: -5.0,
                        offset:
                            Offset(0.0, -3.0), // shadow direction: bottom right
                      )
                    ],
                  ),
                  child: Center(
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                          child: ListView(
                            children: [
                              Text(
                                'Albayat Resort',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                'Choose a date',
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
                              CalendarDatePicker2(
                                config: CalendarDatePicker2Config(),
                                initialValue: [DateTime.now()],
                              ),
                              Divider(
                                color: Colors.grey,
                                height: height * 0.03,
                                indent: 20,
                                endIndent: 20,
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Text('Choose a time',
                                  style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.center),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      aPeriod(
                                        width,
                                        height,
                                        time: '6:00AM to 10:00AM',
                                      ),
                                      aPeriod(
                                        width,
                                        height,
                                        time: '10:30AM to 2:30PM',
                                      ),
                                      aPeriod(
                                        width,
                                        height,
                                        time: '3:00PM to 7:00PM',
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      aPeriod(
                                        width,
                                        height,
                                        time: '6:00AM to 10:00AM',
                                      ),
                                      aPeriod(
                                        width,
                                        height,
                                        time: '10:30AM to 2:30PM',
                                      ),
                                      aPeriod(
                                        width,
                                        height,
                                        time: '3:00PM to 7:00PM',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )))),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 12.0,
              spreadRadius: -5.0,
              offset: Offset(0.0, -3.0), // shadow direction: bottom right
            )
          ],
        ),
        height: height * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //make button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PaymentPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xFF345EA8),
                minimumSize: const Size(190, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: const Text(
                'Confirm',
                style: TextStyle(fontSize: 20),
              ),
            ),

            //price
            const Text(
              'Total: 1200 SAR',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }

  InkWell aPeriod(double width, double height, {required String time}) {
    return InkWell(
      // on tap highlight
      onTap: () {
        setState(() {
          BoxDecoration(
            border: Border.all(
              color: Color.fromARGB(255, 243, 33, 33),
              width: 2,
            ),
          );
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          width: width * 0.4,
          height: height * 0.06,
          decoration: BoxDecoration(
            color: Color(0xFFEBEBF0),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              time,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
