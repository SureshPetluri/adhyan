import 'package:adhyan/view/sign_up/sign_up_controller.dart';
import 'package:adhyan/widgets/app_button.dart';
import 'package:adhyan/widgets/app_text.dart';
import 'package:adhyan/widgets/app_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../routes/app_routes.dart';
import '../../utils/form_utils.dart';
import '../../widgets/app_asset_image.dart';
import '../../widgets/app_gap.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpController controller = SignUpController();
@override
  void initState() {
  controller.nameController.addListener(controller.onTextChanged);
    super.initState();
  }
  @override
  void dispose() {
    controller.nameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppGap(
                    h: 20,
                  ),
                  const AppText(
                    "Let's Get Started!",
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  const AppGap(
                    h: 20,
                  ),
                  const Card(
                    shape: CircleBorder(),
                    clipBehavior: Clip.antiAlias,
                    child: AppAssetImage(
                      imageUrl: "asset/images/profile.jpg",
                      height: 120,
                      width: 120,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const AppText('Name'),
                  AppTextField(

                    formController: controller.nameController,
                    hintText: 'Name',
                    validators: (text) => FormUtils.checkValue(text, text: "Email"),
                    inputFormatter: [
                      FilteringTextInputFormatter.deny(RegExp(r'^\s')),
                      FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z\s]'))
                    ],
                  ),
                  const AppGap(
                    h: 10,
                  ),
                  const AppText('Mobile Number'),
                  AppTextField(
                    formController: controller.mobileController,
                    hintText: 'Mobile',
                  ),
                  const AppGap(
                    h: 10,
                  ),
                  const AppText('Email Address'),
                  AppTextField(
                    formController: controller.emailController,
                    hintText: 'hello@example.com',
                  ),
                  const AppGap(
                    h: 10,
                  ),
                  const AppText('Batch Number'),
                  AppTextField(
                    formController: controller.batchController,
                    hintText: 'Select',
                  ),
                  const AppGap(
                    h: 10,
                  ),
                  const AppText('Set Password'),
                  AppTextField(
                    formController: controller.passwordController,
                    hintText: 'Password',
                    validators: FormUtils.fieldIsPwSpec,
                  ),
                  const AppGap(
                    h: 10,
                  ),
                  const AppText('Conform Password'),
                  AppTextField(
                    formController: controller.conformPasswordController,
                    hintText: 'Conform Password',
                    validators: (text){
                      if(controller.isMatching){
                        return null;
                      }else{
                        return "Password and confirm password should be same";
                      }
                    },
                  ),
                  const AppGap(
                    h: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: AppButton(
                      onPressed: () {
                        controller.submitSignUp(context);
                      },
                      buttonBackgroundColor: Colors.blue,
                      title: "Create Account", buttonBorderColor: Colors.blue,
                    ),
                  ),
                  const AppGap(
                    h: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Have an account?',
                            style: TextStyle(
                                fontSize: 14.0), // Set the text color to blue
                          ),
                          TextSpan(
                            text: ' Sign In',
                            style: const TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap =
                                  () => Navigator.pushNamed(context, Routes.signIn),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const AppGap(
                    h: 20,
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
