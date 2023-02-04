// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:locare/screens/login/owner/owner_login_view.dart';
import 'package:locare/screens/home_base.dart';
import 'package:locare/screens/signup/utils.dart';
import 'package:locare/services/auth.dart';
import 'package:locare/widgets/custom_textfield.dart';
import 'package:locare/widgets/custom_textformfield.dart';

import '../../../widgets/custom_button.dart';
import '../login/user/user_login_view.dart';

class UserSignUpView extends StatefulWidget {
  const UserSignUpView({super.key});

  @override
  State<UserSignUpView> createState() => _UserSignUpViewState();
}

class _UserSignUpViewState extends State<UserSignUpView> {
  final formKey = GlobalKey<FormState>();
  final userEmailController = TextEditingController();
  final userPasswordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final cityController = TextEditingController();
  final confrimPasswordController = TextEditingController();

  bool index = true;
  bool checkBoxValue = false;
  @override
  void dispose() {
    userEmailController.dispose();
    userPasswordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    cityController.dispose();
    confrimPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Center(
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
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08),
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
                          fontSize: MediaQuery.of(context).size.height * 0.1,
                          // fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      // make a line
                      index
                          ? Column(
                              children: [
                                CustomTextFormField(
                                  label: 'Email',
                                  hint: 'Enter your email',
                                  isPassword: false,
                                  controller: userEmailController,
                                ),
                                CustomTextFormField(
                                    label: 'Password',
                                    hint: 'Enter your password',
                                    isPassword: true,
                                    controller: userPasswordController),
                                CustomTextFormField(
                                    label: 'Confirm Password',
                                    hint: 'Enter your password',
                                    isPassword: true,
                                    controller: confrimPasswordController),
                                CustomButton(
                                  label: 'Next',
                                  onPressed: () {
                                    setState(() {
                                      index = !index;
                                    });
                                  },
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                CustomTextField(
                                    label: 'Name',
                                    hint: 'Enter your name',
                                    isPassword: false,
                                    controller: nameController),
                                CustomTextField(
                                    label: 'City',
                                    hint: 'Select City',
                                    isPassword: false,
                                    controller: cityController),
                                CustomTextField(
                                    label: 'Phone Number',
                                    hint: 'Enter Your phone number',
                                    isPassword: false,
                                    controller: phoneController),
                                // make a button to go back

                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      index = !index;
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Back',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                    ),
                                  ),
                                ),
                                CustomButton(
                                  label: 'Sign Up',
                                  onPressed: () {
                                    setState(() {
                                      if (confrimPasswordController.text
                                              .trim() !=
                                          userPasswordController.text.trim()) {
                                        Utils.showSnackBar(
                                            'Passwords don\'t match');
                                      } else {
                                        signUp(
                                          context,
                                          userEmailController.text.trim(),
                                          userPasswordController.text.trim(),
                                          nameController.text.trim(),
                                          cityController.text.trim(),
                                          phoneController.text.trim(),
                                        );
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: 'Already have an account?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.017,
                          ),
                        ),
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const LoginView()));
                            },
                            child: Text(' Login',
                                style: TextStyle(
                                  color: Color(0xffF9A826),
                                  decoration: TextDecoration.underline,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.017,
                                )),
                          ),
                        ),
                      ])),
                      Row(children: [
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.only(
                                  right: MediaQuery.of(context).size.height *
                                      0.01),
                              child: Divider(
                                color: Colors.white,
                                height: 36,
                              )),
                        ),
                        Text(
                          "Or login with",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.017,
                          ),
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.height *
                                      0.01),
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
                          IconButton(
                              // add width and hieght
                              iconSize:
                                  MediaQuery.of(context).size.height * 0.1,
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                'assets/google.svg',
                                width:
                                    MediaQuery.of(context).size.height * 0.075,
                                height:
                                    MediaQuery.of(context).size.height * 0.075,
                              )),
                          IconButton(
                              // add width and hieght
                              iconSize:
                                  MediaQuery.of(context).size.height * 0.1,
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                'assets/apple.svg',
                                width:
                                    MediaQuery.of(context).size.height * 0.075,
                                height:
                                    MediaQuery.of(context).size.height * 0.075,
                              )),
                        ],
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
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
      ),
    );
  }
}
