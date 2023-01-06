import 'package:flutter/material.dart';
import 'package:locare/pages/screens/paymentSuccess.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        //make back button
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          elevation: 0,
          //make back button
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            // change position
          ),
        ),
        body: Column(
          children: [
            const Text(
              'You are almost done!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const Text(
              'One last step..',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
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
                    offset: Offset(0.0, -3.0), // shadow direction: bottom right
                  )
                ],
              ),
              child: const ContentOfPayment(),
              //all children of the container are here
            )),
          ],
        ),
        bottomSheet: Container(
          height: height * 0.2,
          width: width,
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
                offset: Offset(0.0, -3.0), // shadow direction: bottom right
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Albayat Resort',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Hai Alshati, Dammam',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              const Text(
                '6:00AM to 10:00PM',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Total: 1200 SAR',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: width * 0.05,
              ),
            ],
          ),
        ));
  }
}

class ContentOfPayment extends StatelessWidget {
  const ContentOfPayment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ListView(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(41, 0, 41.0, 0),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: height * 0.05,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Pay with Card',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 3,
              ),
              Image.asset(
                "assets/Group 4012.png",
                width: width * 0.45,
              ),
            ],
          ),

          SizedBox(
            height: height * 0.015,
          ),
          SizedBox(
            width: width * 0.8,
            child: const TextField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Card Number',
              ),
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: width * 0.13,
                child: const TextField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'MM/YY',
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.13,
              ),
              SizedBox(
                width: width * 0.11,
                child: const TextField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'CVV',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.01,
          ),
          SizedBox(
            width: width * 0.8,
            child: const TextField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Name on Card',
              ),
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          //pay button
          SizedBox(
            width: width * 0.7,
            height: height * 0.055,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PaymentSuccess()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF345EA8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Pay',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),

          SizedBox(
            width: width * 0.7,
            height: height * 0.055,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PaymentSuccess()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Pay with Apple Pay',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),

          Divider(
            color: Colors.grey,
            thickness: 0.5,
            indent: width * 0.01,
            endIndent: width * 0.01,
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Row(
            children: [
              SizedBox(
                width: width * 0.055,
              ),
              SizedBox(
                width: width * 0.4,
                height: height * 0.055,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaymentSuccess()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'On Arrival +50',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.02,
              ),
              SizedBox(
                width: width * 0.3,
                height: height * 0.055,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaymentSuccess()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Image.asset(
                    "assets/Tamara_Logo-EN.png",
                    width: width * 0.2,
                    height: height * 0.08,
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    ]);
  }
}
