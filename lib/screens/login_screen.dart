import 'package:flutter/material.dart';
import 'package:lc/screens/color_resources.dart';
import 'package:lc/screens/otp_verify.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController userEmail = TextEditingController();
  final TextEditingController userPassword = TextEditingController();
  final GlobalKey<FormState> formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset:false,
     // backgroundColor: Colors.cyan,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image.asset("assets/images/logo.png"),
                    Card(
                      color: ColorResources.color_background_blue,
                      elevation: 70,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: Form(
                            key: formGlobalKey,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: TextFormField(
                                      style: const TextStyle(color: Colors.white),
                                      maxLength: 10,
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Enter Number Please';
                                        }

                                        return null;
                                      },
                                      decoration: const InputDecoration(
                                          prefixIcon: Icon(Icons.smartphone,color: Colors.white,),
                                          prefixText: '+91',
                                          prefixStyle: TextStyle(color: Colors.white,fontSize: 16),
                                          labelText: '    Enter Phone Number ',
                                          labelStyle: TextStyle(
                                              color: Colors.white
                                          ),
                                          contentPadding: EdgeInsets.zero,
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 2,
                                                  color:Colors.white
                                              )
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color:Colors.white
                                              )
                                          ),
                                          focusColor:Colors.white
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 1.0, right: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => OtpVerificationScreen(),
                                              ),
                                            );
                                          },
                                          child: const Text(
                                            "Send OTP",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Don't you have an account? ",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      InkWell(
                                        // onTap: () {
                                        //   Utilities.push(context, const SignUpScreen());
                                        // },
                                        child: Text(
                                          ' SignUp',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Column(
                                    children: <Widget>[Text("above")],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                                          child: const Divider(
                                            color: Colors.white30,
                                            height: 36,
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        "OR",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                                          child: const Divider(
                                            color: Colors.white30,
                                            height: 36,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Column(
                                    children: <Widget>[Text("below ")],
                                  ),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Sign up with ",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      InkWell(
                                        // onTap: () {
                                        //   Utilities.push(context, const SignUpScreen());
                                        // },
                                        child: Text(
                                          'Google',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]
      )

      );
  }
}
