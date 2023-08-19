import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:zero_waste_kitchen/screens/auth/login_screen.dart';
import 'package:zero_waste_kitchen/screens/main/main_screen.dart';

import '../../utils/constants.dart';
import '../../utils/helper_function.dart';
import 'auth_controller.dart';
import 'custom_text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({required this.isDonor, super.key});
  final bool isDonor;
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  bool isLoading = false;
  String? emailErrorText;
  String? nameErrorText;
  String? passwordErrorText;
  XFile? _image;

  void signup() async {
    //* check validation
    // check image and show snackbar error if null
    if (_image == null) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Please upload a profile picture'),
        ),
      );
      return;
    }
    // check name
    if (nameController.text.trim().length < 3) {
      nameErrorText = 'Please enter a valid name';
    } else {
      nameErrorText = null;
      setState(() {});
    }
    // check email
    if (!isEmailValid(emailController.text.trim())) {
      emailErrorText = 'Please enter a valid email';
    } else {
      emailErrorText = null;
      setState(() {});
    }
    // check password
    if (passwordController.text.trim().length < 6) {
      passwordErrorText = 'Password must have 6 characters or more';
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
    final bool? isRegistered = await context.read<AuthController>().signUp(
          context,
          emailController.text.trim(),
          passwordController.text.trim(),
          _image!,
          nameController.text.trim(),
          widget.isDonor,
        );

    setState(() {
      isLoading = false;
    });
    if (isRegistered == true) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MainScreen()));
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    formKey.currentState?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("is donor => ${widget.isDonor}");
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
                  const SizedBox(width: double.infinity, height: 20),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Sign ",
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        TextSpan(
                            text: "Up",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                  color: Constants.kPrimaryColor,
                                )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
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
                  // upload profile picture
                  const SizedBox(height: 20.0),
                  Center(
                    child: GestureDetector(
                      onTap: () async {
                        final XFile? image = await ImagePicker().pickImage(
                          source: ImageSource.gallery,
                        );
                        if (image != null) {
                          setState(() {
                            _image = image;
                          });
                        }
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: _image == null
                            ? const Icon(
                                Icons.add_a_photo,
                                color: Colors.grey,
                                size: 40,
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  File(_image!.path),
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  // * Form
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextFormField(
                          controller: nameController,
                          hintText: "Name",
                          prefixIcon: Icons.person,
                          errorText: nameErrorText,
                        ),
                        const SizedBox(height: 20.0),
                        CustomTextFormField(
                          controller: emailController,
                          hintText: "E-mail",
                          prefixIcon: Icons.email,
                          errorText: emailErrorText,
                        ),
                        const SizedBox(height: 20.0),
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
                        onPressed: signup,
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
