import 'package:flutter/material.dart';
import 'package:zero_waste_kitchen/screens/auth/login_screen.dart';

import '../../utils/constants.dart';
import 'custom_text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    formKey.currentState?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: double.infinity, height: 70),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Welcome To\n",
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        TextSpan(
                            text: "Zero Waste Kitchen",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                  color: Constants.kPrimaryColor,
                                )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Create your account!",
                    //  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    //  fontWeight: FontWeight.w400,
                    // color: Constants.kGrey,
                    //fontSize: 18,
                    //),
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontSize: 18,
                    ),
                  ),

                  // * Form
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        Text("Email",
                            style: Theme.of(context).textTheme.titleLarge),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextFormField(
                          controller: emailController,
                          hintText: "E-mail",
                          prefixIcon: Icons.email,
                        ),
                        const SizedBox(height: 20.0),
                        Text("Password",
                            style: Theme.of(context).textTheme.titleLarge),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextFormField(
                          controller: passwordController,
                          hintText: "Password",
                          prefixIcon: Icons.lock,
                          isPassword: true,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30.0),

                  // * Sign Up Button
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(
                      child: const Text("Sign Up"),
                      onPressed: () {
                        //
                      },
                    ),
                  ),

                  // * Sign In, if you are already a user
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Constants.kBlackColor,
                            ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: Text("Login",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Constants.kPrimaryColor,
                                )),
                      ),
                    ],
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
