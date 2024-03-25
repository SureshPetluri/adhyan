import 'package:adhyan/view/forgot_password/forgot_password_controller.dart';
import 'package:adhyan/widgets/app_button.dart';
import 'package:adhyan/widgets/app_gap.dart';
import 'package:adhyan/widgets/app_text.dart';
import 'package:adhyan/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  ForgotPasswordController controller = ForgotPasswordController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppGap(
              h: 25,
            ),
            const AppText(
              'Forgot Password?',
              fontSize: 28,
            ),
            const AppGap(
              h: 15,
            ),
            const AppText(
              'Enter the email associated with your account and we will send an authentication code reset you password',
              fontSize: 16,
            ),
            const AppGap(
              h: 20,
            ),
            const AppText('Email Address'),
            AppTextField(
              formController: controller.emailController,
              hintText: 'hello@example.com',
            ),
            const AppGap(
              h: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: AppButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.verify);
                },
                buttonBackgroundColor: Colors.blue,
                title: 'Submit',buttonBorderColor: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
