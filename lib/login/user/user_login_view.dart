// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:locare/login/owner/owner_login_view.dart';
import 'package:locare/pages/homeBody.dart';
import 'package:locare/widgets/custom_textfield.dart';

import '../../signup/user_signup_view.dart';
import '../../widgets/custom_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final userEmailController = TextEditingController();
  final userPasswordController = TextEditingController();
  bool checkBoxValue = false;
  @override
  void dispose() {
    userEmailController.dispose();
    userPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/loginBG.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.height * 0.042,
                    MediaQuery.of(context).size.height * 0.01,
                    MediaQuery.of(context).size.height * 0.042,
                    MediaQuery.of(context).size.height * 0.01),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                    Text(
                      'Welcome to',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.05,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Locare',
                      style: TextStyle(
                        height: 1,
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.12,
                        // fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    // make a line

                    CustomTextField(
                        label: 'Email',
                        hint: 'Enter your email',
                        isPassword: false,
                        controller: userEmailController),

                    CustomTextField(
                        label: 'Password',
                        hint: 'Enter your password',
                        isPassword: true,
                        controller: userPasswordController),

                    Row(
                      children: [
                        // Text('data'),
                        Theme(
                          data: ThemeData(
                            unselectedWidgetColor: Colors.white,
                          ),
                          child: Checkbox(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              visualDensity:
                                  VisualDensity(horizontal: -4, vertical: -4),
                              value: checkBoxValue,
                              onChanged: (value) {
                                setState(() {
                                  checkBoxValue = value!;
                                });
                              }),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.height * 0.009,
                        ),
                        Text('Stay logged in?',
                            style: TextStyle(
                              color: Color.fromARGB(141, 153, 153, 153),
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.017,
                            )),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              // ---down here is the path to the forgot password page
                              builder: (context) => const LoginView(),
                            ));
                          },
                          child: Text('Forgot Password?',
                              style: TextStyle(
                                color: Color.fromARGB(141, 153, 153, 153),
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.017,
                              )),
                        ),
                      ],
                    ),
                    CustomButton(
                      label: 'Sign In',
                      onPressed: () {
                        // return homebody page
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const HomeBody()));
                        // signIn()
                      },
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: 'Don\'t have an account yet?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.017,
                        ),
                      ),
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const UserSignUpView()));
                          },
                          child: Text(' Sign Up',
                              style: TextStyle(
                                color: Color(0xffF9A826),
                                decoration: TextDecoration.underline,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.017,
                              )),
                        ),
                      ),
                    ])),

                    Row(children: [
                      Expanded(
                        child: Container(
                            margin: EdgeInsets.only(
                                right:
                                    MediaQuery.of(context).size.height * 0.01),
                            child: Divider(
                              color: Colors.white,
                              height: 36,
                            )),
                      ),
                      Text(
                        "Or login with",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.017,
                        ),
                      ),
                      Expanded(
                        child: Container(
                            margin: EdgeInsets.only(
                                left:
                                    MediaQuery.of(context).size.height * 0.01),
                            child: Divider(
                              color: Colors.white,
                              height: 36,
                            )),
                      ),
                    ]),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // IconButton(
                        //     // add width and hieght
                        //     iconSize: MediaQuery.of(context).size.height * 0.1,
                        //     onPressed: () {},
                        //     icon: SvgPicture.asset(
                        //       'assets/google.svg',
                        //       width: MediaQuery.of(context).size.height * 0.1,
                        //       height: MediaQuery.of(context).size.height * 0.1,
                        //     )),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: CircleBorder(), //<-- SEE HERE
                              padding: EdgeInsets.all(20),
                            ),
                            onPressed: () {},
                            child: SvgPicture.asset(
                              'assets/google.svg',
                              width: MediaQuery.of(context).size.height * 0.06,
                              height: MediaQuery.of(context).size.height * 0.06,
                              // fit: BoxFit.fill,
                            )),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,

                              shape: CircleBorder(), //<-- SEE HERE
                              padding: EdgeInsets.all(20),
                            ),
                            onPressed: () {
                              // loading();
                            },
                            child: SvgPicture.asset(
                              'assets/apple.svg',
                              width: MediaQuery.of(context).size.height * 0.06,
                              height: MediaQuery.of(context).size.height * 0.06,
                              // fit: BoxFit.fill,
                            )),
                      ],
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                        onPressed: (() {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const OwnerLoginView()));
                        }),
                        child: Text(
                          'Sign in as owner',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.017,
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      )),
    );
  }
}
