import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zero_waste_kitchen/screens/auth/login_screen.dart';
import 'package:zero_waste_kitchen/screens/main/main_screen.dart';

import '../../utils/constants.dart';
import '../../utils/helper_function.dart';
import 'auth_controller.dart';
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
  bool isLoading = false;
  String? emailErrorText;
  String? passwordErrorText;

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
                          errorText: emailErrorText,
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
                          errorText: passwordErrorText,
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
                        onPressed: () async {
                          //* check validation
                          // check email
                          if (!isEmailValid(emailController.text.trim())) {
                            emailErrorText = 'Please enter a valid email';
                          } else {
                            emailErrorText = null;
                            setState(() {});
                          }
                          // check password
                          if (passwordController.text.trim().length < 6) {
                            passwordErrorText =
                                'Password must have 6 characters or more';
                            setState(() {});
                            return;
                          } else {
                            passwordErrorText = null;
                            setState(() {});
                          }
                          // here all fields are validated
                          setState(() {
                            emailErrorText = null;
                            passwordErrorText = null;
                            isLoading = true;
                          });
                          // login user
                          final bool? isRegistered = await context
                              .read<AuthController>()
                              .signUp(context, emailController.text.trim(),
                                  passwordController.text.trim());

                          setState(() {
                            isLoading = false;
                          });
                          if (isRegistered == true) {
                            // ignore: use_build_context_synchronously
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MainScreen()));
                          }
                        },
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white)
                            : const Text("Sign Up")),
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
