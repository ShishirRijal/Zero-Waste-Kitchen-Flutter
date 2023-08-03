import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zero_waste_kitchen/screens/auth/custom_text_form_field.dart';
import 'package:zero_waste_kitchen/utils/utils.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();
  String? errorText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  LottieBuilder.asset('assets/json/forgot-password.json',
                      height: 200),
                  const SizedBox(height: 20.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Forgot Password?",
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  CustomTextFormField(
                    controller: emailController,
                    hintText: "Enter your email",
                    errorText: errorText,
                    prefixIcon: Icons.email,
                  ),
                  const SizedBox(height: 50.0),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                        onPressed: () {
                          if (!isEmailValid(emailController.text)) {
                            errorText = "Please enter a valid email";
                            setState(() {});
                            return;
                          }
                          setState(() {
                            errorText = null;
                          });

                          // TODO: Send reset password link to email
                        },
                        child: const Text("Reset Password")),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
